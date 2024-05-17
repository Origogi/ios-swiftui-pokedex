//
//  RegionInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import Foundation

enum RegionType: CaseIterable, Identifiable {
    case kanto
    case johto
    case hoenn
    case sinnoh
    case unova
    case kalos
    case alola

    var id: String { title }

    var pokedexIdRange: ClosedRange<Int> {
        switch self {
        case .kanto:
            return 1 ... 151
        case .johto:
            return 152 ... 251
        case .hoenn:
            return 252 ... 386
        case .sinnoh:
            return 387 ... 494
        case .unova:
            return 495 ... 649
        case .kalos:
            return 650 ... 721
        case .alola:
            return 722 ... 807
        }
    }

    var firstGeneration: RegionType {
        return .kanto
    }

    var lastGeneration: RegionType {
        return .alola
    }

    var firstPokemonId: Int {
        return pokedexIdRange.lowerBound
    }

    var lastPokemonId: Int {
        return pokedexIdRange.upperBound
    }

    // title
    var title: String {
        switch self {
        case .kanto:
            return "Kanto"
        case .johto:
            return "Johto"
        case .hoenn:
            return "Hoenn"
        case .sinnoh:
            return "Sinnoh"
        case .unova:
            return "Unova"
        case .kalos:
            return "Kalos"
        case .alola:
            return "Alola"
        }
    }

    var generation: Int {
        switch self {
        case .kanto:
            return 1
        case .johto:
            return 2
        case .hoenn:
            return 3
        case .sinnoh:
            return 4
        case .unova:
            return 5
        case .kalos:
            return 6
        case .alola:
            return 7
        }
    }

    var bgImagePath: String {
        switch self {
        case .kanto:
            return "kanto"
        case .johto:
            return "johto"
        case .hoenn:
            return "hoenn"
        case .sinnoh:
            return "sinnoh"
        case .unova:
            return "unova"
        case .kalos:
            return "kalos"
        case .alola:
            return "alola"
        }
    }

    var startingPokemonImagPaths: [String] {
        switch self {
        case .kanto:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/1.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/4.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/7.png",
            ]
        case .johto:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/152.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/155.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/158.png",
            ]
        case .hoenn:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/252.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/255.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/258.png",
            ]
        case .sinnoh:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/387.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/390.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/393.png",
            ]
        case .unova:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/495.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/498.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/501.png",
            ]
        case .kalos:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/650.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/653.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/656.png",
            ]
        case .alola:
            return [
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/722.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/725.png",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/728.png",
            ]
        }
    }
}
