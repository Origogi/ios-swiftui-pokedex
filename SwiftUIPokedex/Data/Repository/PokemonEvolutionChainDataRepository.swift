//
//  PokemonEvolutionChainDataRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/12/24.
//

import Foundation

class PokemonEvolutionChainDataRepository {
  func get(chainId: Int) async -> PokemonEvolutionChainData {
    let url = URL(string: "https://pokeapi.co/api/v2/evolution-chain/\(chainId)")!
    let (data, _) = try! await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let evolutionChainData = try! decoder.decode(PokemonEvolutionChainData.self, from: data)
    
    return evolutionChainData
  }
  
  func get(from : String) async -> PokemonEvolutionChainData {
    let url = URL(string: from)!
    let (data, _) = try! await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let evolutionChainData = try! decoder.decode(PokemonEvolutionChainData.self, from: data)
    
    return evolutionChainData
  }
}
