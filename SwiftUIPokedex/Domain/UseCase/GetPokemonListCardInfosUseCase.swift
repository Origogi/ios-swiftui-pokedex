//
//  GetPokemonListCardInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/3/24.
//

import Foundation

class GetPokemonListCardInfosUseCase {
  
  private let pokemonInfoRepository : PokemonInfoRepository
  
  init(pokemonInfoRepository: PokemonInfoRepository) {
    self.pokemonInfoRepository = pokemonInfoRepository
  }
  
  func execute() -> [PokemonCardInfo] {
    return pokemonInfoRepository.getAll().map { pokemon in
      PokemonCardInfo(
        pokedexId : pokemon.id,
        name : pokemon.name,
        imagePath : pokemon.mediumImagePath,
        types: pokemon.types
      )
    }
  }
}
