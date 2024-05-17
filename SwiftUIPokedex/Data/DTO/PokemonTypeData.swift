//
//  PokemonTypeData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/9/24.
//

import Foundation

struct PokemonTypeData: Decodable {
    let damageRelations: DamageRelations

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
    }
}

struct DamageRelations: Decodable {
    let doubleDamageFrom: [NameUrlData]
    let doubleDamageTo: [NameUrlData]
    let halfDamageFrom: [NameUrlData]
    let halfDamageTo: [NameUrlData]

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
        case halfDamageFrom = "half_damage_from"
        case halfDamageTo = "half_damage_to"
    }
}
