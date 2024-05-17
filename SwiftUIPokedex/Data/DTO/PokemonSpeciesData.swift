//
//  PokemonSpeciesData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/9/24.
//

import Foundation

struct PokemonSpeciesData: Decodable {
    let flavorTextEntries: [FlavorTextEntry]
    let genera: [PokemonGeneraData]
    let gendrerRate: Int
    let evolutionChain: UrlData

    var englishFlavorText: String {
        return flavorTextEntries.first(where: { $0.language.name == "en" })?.flavorText ?? ""
    }

    var genderRateFraction: Double? {
        if gendrerRate == -1 {
            return nil
        }

        return (8 - Double(gendrerRate)) / 8
    }

    var englishGenus: String {
        return genera.first(where: { $0.language.name == "en" })?.genus ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
        case gendrerRate = "gender_rate"
        case genera
        case evolutionChain = "evolution_chain"
    }
}

struct FlavorTextEntry: Decodable {
    let flavorText: String
    let language: NameUrlData

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct PokemonGeneraData: Decodable {
    let genus: String
    let language: NameUrlData
}
