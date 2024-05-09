//
//  PokemonListRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/9/24.
//

import Foundation

class PokemonListDataRepository {
  func list(offset : Int = 0, limit : Int = 20) async -> PokemonListData? {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)") else {
      print("Invalid URL")
      return nil
    }
    
    do {
      let (data, response) = try await URLSession.shared.data(from: url)
      
      guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        print("Server error")
        return nil
      }
      
      let decoder = JSONDecoder()
      let apiResponse = try decoder.decode(PokemonListData.self, from: data)
      return apiResponse
    } catch {
      print("Error fetching or decoding data: \(error.localizedDescription)")
    }
    
    return nil
  }
}
