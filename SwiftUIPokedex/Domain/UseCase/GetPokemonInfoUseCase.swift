//
//  GetPokemonInfoUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class GetPokemonInfoUseCase {
  
  private let pokemonInfoRepository : PokemonInfoRepository
  
  init(pokemonInfoRepository: PokemonInfoRepository) {
    self.pokemonInfoRepository = pokemonInfoRepository
  }
  
  func execute(id: Int) -> PokemonInfo {
    return pokemonInfoRepository.getById(id)
  }
}

