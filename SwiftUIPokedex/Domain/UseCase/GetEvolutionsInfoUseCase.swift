//
//  GetEvolutionsInfoUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class GetEvolutionsInfoUseCase {
  private let pokemonEvolutionsDataRepository : PokemonEvolutiosDataRepository
  private let pokemonInfoRepository : PokemonInfoRepository
  
  init(pokemonEvolutionsDataRepository: PokemonEvolutiosDataRepository, pokemonInfoRepository: PokemonInfoRepository) {
    self.pokemonEvolutionsDataRepository = pokemonEvolutionsDataRepository
    self.pokemonInfoRepository = pokemonInfoRepository
  }
  
  func execute(pokemonId: Int) -> EvolutionsInfo {
    let evolData = pokemonEvolutionsDataRepository.getByPokemonId(pokemonId: pokemonId)
    
    return EvolutionsInfo(
      chains: evolData.chains.map { chain in
        let pokemonData = pokemonInfoRepository.getById(chain.next)
        
        return EvolutionChain(
          condition: chain.condition,
          next: pokemonData
        )
      }
    )
    
  }
}
