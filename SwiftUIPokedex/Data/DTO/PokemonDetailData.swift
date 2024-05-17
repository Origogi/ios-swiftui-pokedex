//
//  PokemonDetailData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/8/24.
//

import Foundation

struct PokemonDetailData: Decodable {
    let id: Int
    let name: String
    let types: [PokemonDetailTypeData]
    let weight: Double
    let height: Double
    let sprites: PokemonSpritesData
    let abilities: [PokemonAbilityData]
}

struct PokemonDetailTypeData: Decodable {
    let slot: Int
    let type: NameUrlData
}

struct PokemonSpritesData: Decodable {
    let frontDefault: String
    let other: OtherData
    let versions: VersionsData

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case other
        case versions
    }
}

struct ImageUrlSetData: Decodable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct VersionsData: Decodable {
    let generationVII: GenerationVIIData

    enum CodingKeys: String, CodingKey {
        case generationVII = "generation-vii"
    }
}

struct OtherData: Decodable {
    let showdown: ImageUrlSetData
}

struct GenerationVIIData: Decodable {
    let icons: ImageUrlSetData
}

struct PokemonAbilityData: Decodable {
    let ability: NameUrlData
}
