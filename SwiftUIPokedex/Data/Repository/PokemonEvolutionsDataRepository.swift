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
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 1),
          EvolutionChainData(next: 2, condition: "Level 16"),
          EvolutionChainData(next: 3, condition: "Level 32")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 4),
          EvolutionChainData(next: 5, condition: "Level 16"),
          EvolutionChainData(next: 6, condition: "Level 32")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 7),
          EvolutionChainData(next: 8, condition: "Level 16"),
          EvolutionChainData(next: 9, condition: "Level 32")
        ]
      )
    )
    
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 13),
          EvolutionChainData(next: 14, condition: "Level 7"),
          EvolutionChainData(next: 15, condition: "Level 10")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 172),
          EvolutionChainData(next: 25, condition: "Friendship Level"),
          EvolutionChainData(next: 26, condition: "Thunder Stone")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 172),
          EvolutionChainData(next: 25, condition: "Friendship Level"),
          EvolutionChainData(next: 26, condition: "Thunder Stone")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 173),
          EvolutionChainData(next: 35, condition: "Friendship Level"),
          EvolutionChainData(next: 36, condition: "Moon Stone")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 50),
          EvolutionChainData(next: 51, condition: "Level 26")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 95),
          EvolutionChainData(next: 208, condition: "Trade")
        ]
      )
    )
          
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 108),
          EvolutionChainData(next: 463, condition: "Leveling up with Rollout")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 109),
          EvolutionChainData(next: 110, condition: "Level 35")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 151),
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 245),
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 304),
          EvolutionChainData(next: 305, condition: "Level 32"),
          EvolutionChainData(next: 306, condition: "Level 42")
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 384),
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 447),
          EvolutionChainData(next: 448, condition: "Friendship Level"),

        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 495),
          EvolutionChainData(next: 496, condition: "Level 17"),
          EvolutionChainData(next: 497, condition: "Level 36"),
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 570),
          EvolutionChainData(next: 571, condition: "Level 30"),
          
        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 607),
          EvolutionChainData(next: 608, condition: "Level 41"),
          EvolutionChainData(next: 609, condition: "Dusk Stone"),

        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 613),
          EvolutionChainData(next: 614, condition: "Level 37"),

        ]
      )
    )
    
    addDataToDic(
      evolutionsData: EvolutionsData(
        chains: [
          EvolutionChainData(next: 731),
          EvolutionChainData(next: 732, condition: "Level 14"),
          EvolutionChainData(next: 733, condition: "Level 28"),

        ]
      )
    )
    

    
  }
  
  func addDataToDic(evolutionsData: EvolutionsData) {
    evolutionsData.chains.forEach { chain in
      self.dict[chain.next] = evolutionsData
    }
  }
  
  func getByPokemonId(pokemonId: Int) -> EvolutionsData {
    return self.dict[pokemonId]!
  }
  
}
