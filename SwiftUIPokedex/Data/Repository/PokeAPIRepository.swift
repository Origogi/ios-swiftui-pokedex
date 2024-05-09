//
//  PokeAPIRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/8/24.
//

import Foundation

class PokeAPIRepository {
  
  func list(offset : Int = 0, limit : Int = 20) async -> PokemonListAPIResponse? {
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
      let apiResponse = try decoder.decode(PokemonListAPIResponse.self, from: data)
      return apiResponse
    } catch {
      print("Error fetching or decoding data: \(error.localizedDescription)")
    }
    
    return nil
  }
  
  func getDetail(id : Int) async -> PokemonDetailData? {
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
      print("Fetched Pokemon Data: \(detail)")
      return detail
    } catch {
      print("Error fetching or decoding data: \(error.localizedDescription)")
    }
    return nil
  }
  
  func getDetail(from : String) async -> PokemonDetailData? {
    guard let url = URL(string: from) else {
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
      print("Fetched Pokemon Data: \(detail)")
      return detail
    } catch {
      print("Error fetching or decoding data: \(error.localizedDescription)")
    }
    return nil
  }
}
