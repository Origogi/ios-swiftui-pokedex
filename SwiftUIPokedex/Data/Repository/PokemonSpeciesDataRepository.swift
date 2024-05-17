//
//  PokemonSpeciesDataRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/9/24.
//

import Foundation

class PokemonSpeciesDataRepository {
    func get(id: Int) async -> PokemonSpeciesData {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(id)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let speciesData = try! decoder.decode(PokemonSpeciesData.self, from: data)

        return speciesData
    }
}
