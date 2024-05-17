//
//  PokemonDetailInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

struct PokemonDetailInfo {
    let id: Int
    let name: String
    let weight: Double
    let height: Double
    let category: String
    let abilities: [String]
    let description: String
    let types: [PokemonTypeInfo]
    let genderRatio: Double?
    let weaknesses: [PokemonTypeInfo]
    let evolutionChain: EvolutionChain
    let animatedImageUrl: String

    var mainType: PokemonTypeInfo {
        return types.first!
    }
}
