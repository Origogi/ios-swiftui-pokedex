//
//  GetEvolutionsInfoUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class GetEvolutionsInfoUseCase {
  private let pokemonEvolutionsDataRepository : PokemonEvolutiosDataRepository = PokemonEvolutiosDataRepository()
  private let pokemonInfoRepository : PokemonDataRepository = PokemonDataRepository()
  
  
  func execute(id: Int) -> EvolutionsInfo {
    let evolData = pokemonEvolutionsDataRepository.getByPokemonId(pokemonId: id)
    
    return EvolutionsInfo(
      chains: evolData.chains.map { chain in
        let pokemonData = pokemonInfoRepository.getById(chain.next)
        
        return EvolutionChain(
          condition: chain.condition,
          next: PokemonCardInfo(
            id: pokemonData.id,
            name: pokemonData.name,
            imagePath: pokemonData.smallImagePath,
            types: pokemonData.types
          )
        )
      }
    )
    
  }
}
