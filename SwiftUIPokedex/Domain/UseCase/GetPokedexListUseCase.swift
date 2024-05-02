//
//  GetPokemonListCardInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/3/24.
//

import Foundation

class GetPokedexListUseCase {
  
  private let pokemonInfoRepository : PokemonDataRepository = PokemonDataRepository()

  
  func execute(type: PokemonTypeInfo? = nil) -> [PokemonCardInfo] {
    // Retrieve data: either filtered by type or all entries
    let pokemonList = type != nil ? pokemonInfoRepository.listByType(type!) : pokemonInfoRepository.list()
    
    // Apply common filtering and mapping
    return pokemonList.filter { pokemon in
      // Include additional type check if type is provided
      type == nil || pokemon.types.contains(type!)
    }.filter { pokemon in
      pokemon.hasDetailInfo
    }.map { pokemon in
      PokemonCardInfo(
        pokedexId: pokemon.id,
        name: pokemon.name,
        imagePath: pokemon.mediumImagePath,
        types: pokemon.types
      )
    }
  }
}