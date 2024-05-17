//
//  PokemonWeaknessTypesRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/13/24.
//

import Foundation

// cache for weakness types
class PokemonWeaknessTypesRepository {
    static let shared = PokemonWeaknessTypesRepository()

    // Dictionary cache
    private var cache = [PokemonTypeInfo: [PokemonTypeInfo]]()

    private init() {}

    func get(from type: PokemonTypeInfo) -> [PokemonTypeInfo]? {
        return cache[type]
    }

    func set(weaknesses: [PokemonTypeInfo], for type: PokemonTypeInfo) {
        cache[type] = weaknesses
    }
}
