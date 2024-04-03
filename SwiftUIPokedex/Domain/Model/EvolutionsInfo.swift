//
//  EvolutionsInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import Foundation


struct EvolutionsInfo{
  let chains : [EvolutionChain]
}

struct EvolutionChain : Identifiable {
  let id: UUID = UUID()
  
  let condition : String?
  let next : PokemonCardInfo
  
  init(condition: String? = nil, next: PokemonCardInfo) {
    self.condition = condition
    self.next = next
  }
}
