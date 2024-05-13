//
//  EvolutionsInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import Foundation


class EvolutionChain : Identifiable {
  
  let id: UUID = UUID()
  let cardInfo : PokemonCardInfo
  let next : EvolutionChain?
  
  init(cardInfo: PokemonCardInfo, next: EvolutionChain? = nil) {
    self.cardInfo = cardInfo
    self.next = next
  }
}
