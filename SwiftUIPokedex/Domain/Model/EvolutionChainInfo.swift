//
//  EvolutionsInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import Foundation

class EvolutionChainInfo: Identifiable {
    let id: UUID = .init()
    let cardInfo: PokemonCardInfo
    let next: EvolutionChainInfo?

    init(cardInfo: PokemonCardInfo, next: EvolutionChainInfo? = nil) {
        self.cardInfo = cardInfo
        self.next = next
    }
}
