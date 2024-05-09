//
//  GetPokemonListCardInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/3/24.
//

import Foundation

class GetPokemonCardInfoListUseCase {
  
  private let pokemonInfoRepository : PokemonDataRepository = PokemonDataRepository()
  private let pokemonListDataRepository : PokemonListDataRepository = PokemonListDataRepository()
  private let pokemonDetailDataRepository : PokemonDetailDataRepository = PokemonDetailDataRepository()

  
  func execute(type: PokemonTypeInfo? = nil, region: RegionType? = nil) -> [PokemonCardInfo] {
    // Retrieve data: either filtered by type or all entries
    let pokemonList = type != nil ? pokemonInfoRepository.listByType(type!) : pokemonInfoRepository.list()
    
    // Apply common filtering and mapping
    return pokemonList
      .filter { pokemon in
        // Include additional type check if type is provided
        type == nil || pokemon.types.contains(type!)
      }
      .filter { pokemon in
        // Include additional region check if region is provided
        region == nil || pokemon.region == region
        
      }
      .filter { pokemon in
        pokemon.hasDetailInfo
      }.map { pokemon in
        PokemonCardInfo(
          id: pokemon.id,
          name: pokemon.name,
          imagePath: pokemon.mediumImagePath,
          types: pokemon.types
        )
      }
  }
  
  func execute(offset : Int, limit : Int) async -> [PokemonCardInfo] {
    // Retrieve data: either filtered by type or all entries
    guard let response = await pokemonListDataRepository.list(offset: offset, limit: limit) else {
      return []
    }
    
    var pokemonCardInfos = [PokemonCardInfo]()
    
    await withTaskGroup(of: PokemonCardInfo?.self) { group in
      for item in response.results {
        group.addTask {
          if let detailData = await self.pokemonDetailDataRepository.get(name: item.name) {
            return PokemonCardInfo(
              id: detailData.id,
              name: detailData.name.capitalized,
              imagePath: detailData.sprites.frontDefault,
              types: detailData.types.map { type in
                return PokemonTypeInfo(rawValue: type.type.name.capitalized) ?? .normal
              }
            )
          }
          return nil
        }
      }
      
      // 결과를 취합
      for await result in group {
        if let cardInfo = result {
          pokemonCardInfos.append(cardInfo)
        }
      }
    }
    return pokemonCardInfos
  }
}
