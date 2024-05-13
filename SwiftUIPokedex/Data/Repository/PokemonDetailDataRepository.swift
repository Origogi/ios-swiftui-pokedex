//
//  PokemonDetailDataRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/9/24.
//

import Foundation

class PokemonDetailDataRepository {
  
  func get(id : Int) async -> PokemonDetailData? {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
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
      let detail = try decoder.decode(PokemonDetailData.self, from: data)
      return detail
    } catch {
      print("Error fetching or decoding data: \(error.localizedDescription)")
    }
    return nil
  }
  
  func get(name : String) async -> PokemonDetailData? {
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(name)") else {
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
      let detail = try decoder.decode(PokemonDetailData.self, from: data)
      return detail
    } catch {
      print("Error fetching or decoding data: \(error.localizedDescription)")
    }
    return nil
  }
}
