//
//  PokemonTypeRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/9/24.
//

import Foundation

class PokemonTypeDataRepository {
  
  func get(type : String) async -> PokemonTypeData {
    let url = URL(string: "https://pokeapi.co/api/v2/type/\(type)")!
    let (data, _) = try! await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let typeData = try! decoder.decode(PokemonTypeData.self, from: data)
    
    return typeData
  }
}
