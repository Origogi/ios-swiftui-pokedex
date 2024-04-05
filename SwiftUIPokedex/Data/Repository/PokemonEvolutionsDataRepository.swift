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
    
    let dataCharmander = EvolutionsData(chains: [
      EvolutionChainData(next: 4),
      EvolutionChainData(next: 5, condition: "Level 16"),
      EvolutionChainData(next: 6, condition: "Level 32")
    ])
    
    self.dict[4] = dataCharmander
    self.dict[5] = dataCharmander
    self.dict[6] = dataCharmander
    
    let dataSquirtle = EvolutionsData(chains: [
      EvolutionChainData(next: 7),
      EvolutionChainData(next: 8, condition: "Level 16"),
      EvolutionChainData(next: 9, condition: "Level 32")
    ])
    
    self.dict[7] = dataSquirtle
    self.dict[8] = dataSquirtle
    self.dict[9] = dataSquirtle

  }
  
  func getByPokemonId(pokemonId: Int) -> EvolutionsData {
    return self.dict[pokemonId]!
  }
  
}
