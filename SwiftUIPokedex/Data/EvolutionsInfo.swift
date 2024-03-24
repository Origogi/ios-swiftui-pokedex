//
//  EvolutionsInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import Foundation


struct EvolutionsInfo {
  let chains : [EvolutionChain]
}

struct EvolutionChain : Identifiable, Hashable {
  var id: UUID = UUID()
  
  let condition : String?
  let next : PokemonInfo
  
  init(condition: String? = nil, next: PokemonInfo) {
    self.condition = condition
    self.next = next
  }
}
