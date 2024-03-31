//
//  PokemonEvolutionChainInfoRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class PokemonEvolutiosDataRepository {
  var dict = [Int : EvolutionsData]()
  
  init() {
    let dataBulbasaur = EvolutionsData(chains: [
      EvolutionChainData(next: 1),
      EvolutionChainData(next: 2, condition: "Level 16"),
      EvolutionChainData(next: 3, condition: "Level 32")
    ])
    
    self.dict[1] = dataBulbasaur
    self.dict[2] = dataBulbasaur
    self.dict[3] = dataBulbasaur
  }
  
  func getByPokemonId(pokemonId: Int) -> EvolutionsData {
    return self.dict[pokemonId]!
  }
  
}
