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
  
  func execute(id: Int) async -> PokemonDetailInfo {
    let detailData = await pokemonDetailDataRepository.get(id: id)!
    let speciesData = await pokemonSpeciesDataRepository.get(id: id)
    let typeData = await pokemonTypeDataRepository.get(type: detailData.types[0].type.name.lowercased())
    
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
      genderRatio: Double((8 - speciesData.gendrerRate)) / 8.0,
      weaknesses: typeData.damageRelations.doubleDamageFrom.map { PokemonTypeInfo(rawValue: $0.name.capitalized )!},
      evolutionsData: EvolutionsInfo(chains: []) // TODO
    )
  }
  
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
}

