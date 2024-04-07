//
//  GetPokemonInfoUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class GetPokemonInfoUseCase {
  
  private let pokemonInfoRepository : PokemonDataRepository
  
  init(pokemonInfoRepository: PokemonDataRepository) {
    self.pokemonInfoRepository = pokemonInfoRepository
  }
  
  func execute(id: Int) -> PokemonData {
    return pokemonInfoRepository.getById(id)
  }
}

