//
//  GetPokemonInfoUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class GetPokemonInfoUseCase {
  
  private let pokemonDetailDataRepository: PokemonDetailDataRepository = PokemonDetailDataRepository()
  private let pokemonSpeciesDataRepository: PokemonSpeciesDataRepository = PokemonSpeciesDataRepository()
  private let pokemonTypeDataRepository: PokemonTypeDataRepository = PokemonTypeDataRepository()
  private let pokemonEvolutionChainDataRepository: PokemonEvolutionChainDataRepository = PokemonEvolutionChainDataRepository()
  
  func execute(id: Int) async -> PokemonDetailInfo {
    let detailData = await pokemonDetailDataRepository.get(id: id)!
    let speciesData = await pokemonSpeciesDataRepository.get(id: id)
    let typeData = await pokemonTypeDataRepository.get(type: detailData.types[0].type.name.lowercased())
    let evolutionChainData = await pokemonEvolutionChainDataRepository.get(from: speciesData.evolutionChain.url)
    
    var evolutionChain = 
      EvolutionChain(
        cardInfo: PokemonCardInfo(id: detailData.id, name: detailData.name.capitalized, imagePath: detailData.sprites.frontDefault, types: detailData.types.map { PokemonTypeInfo(rawValue: $0.type.name.capitalized) ?? .normal }))
        
    
    return PokemonDetailInfo(
      id: detailData.id, 
      name: detailData.name.capitalized,
      weight: detailData.weight,
      height: detailData.height,
      category: extractPokemonPrefix(from: speciesData.englishGenus),
      abilities: detailData.abilities.map { $0.ability.name.capitalized },
      description: speciesData.englishFlavorText.replacingOccurrences(of: "\n", with: " "),
      types: detailData.types.map {
        PokemonTypeInfo(rawValue: $0.type.name.capitalized) ?? .normal
      },
      genderRatio: speciesData.genderRateFraction,
      weaknesses: typeData.damageRelations.doubleDamageFrom.map { PokemonTypeInfo(rawValue: $0.name.capitalized )!},
      evolutionChain: evolutionChain
      
    )
  }
  
//  private func extractEvolutions(from chain: ChainData?) async -> EvolutionChain? {
//    var evolutionInfo : EvolutionsInfo? = nil
//    
//    if let chain = chain {
//      
//      if let id = extractId(from: chain.species.url) {
//        let pokemonDetailData = await pokemonDetailDataRepository.get(id: id)
//        
//        let pokemonCardInfo = PokemonCardInfo(
//          id: id,
//          name: pokemonDetailData?.name.capitalized ?? "", 
//          imagePath: pokemonDetailData?.sprites.frontDefault ?? "",
//          types: pokemonDetailData?.types.map { PokemonTypeInfo(rawValue: $0.type.name.capitalized) ?? .normal } ?? []
//        )
//        
//        evolutionInfo = EvolutionsInfo(
//          chains: [EvolutionChainInfo(
//            species: pokemonCardInfo,
//            evolvesTo: await extractEvolutions(from: chain.evolvesTo.first)
//          )]
//        )
//      }
//    }
//    
//    
//    return evolutionInfo
//  }
  
  private func extractPokemonPrefix(from text: String) -> String {
    let pattern = "^(.+) Pokémon$"
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let matches = regex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
    
    if let match = matches?.first {
      if let range = Range(match.range(at: 1), in: text) {
        return String(text[range])
      }
    }
    
    return ""
  }
  
  func extractId(from urlString: String) -> Int? {
    let pattern = "/(\\d+)/?$"
    guard let regex = try? NSRegularExpression(pattern: pattern) else {
      return nil
    }
    
    let nsString = urlString as NSString
    let results = regex.matches(in: urlString, range: NSRange(location: 0, length: nsString.length))
    
    if let match = results.last, // 가장 마지막 결과를 사용
       let range = Range(match.range(at: 1), in: urlString) {
      return Int(urlString[range])
    }
    return nil
  }
}

