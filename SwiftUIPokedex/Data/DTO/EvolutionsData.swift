//
//  EvolutionsData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

struct EvolutionsData {
    let chains: [EvolutionChainData]
}

struct EvolutionChainData {
    let next: Int
    let condition: String?

    init(next: Int, condition: String? = nil) {
        self.condition = condition
        self.next = next
    }
}
