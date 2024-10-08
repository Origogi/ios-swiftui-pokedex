//
//  PokemonEvolutionChainData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/12/24.
//

import Foundation

struct PokemonEvolutionChainData: Decodable {
    let chain: ChainData
    let id: Int
}

struct ChainData: Decodable {
    let evolvesTo: [ChainData]
    let species: NameUrlData

    enum CodingKeys: String, CodingKey {
//    case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case species
    }
}
