//
//  PokemonDetailData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/8/24.
//

import Foundation

struct PokemonDetailData : Decodable {
  let id : Int
  let name : String
  let types : [PokemonDetailTypeData]
  let weight: Double
  let height: Double
  let sprites : PokemonSpritesData
  let abilities : [PokemonAbilityData]
}

struct PokemonDetailTypeData : Decodable {
  let slot : Int
  let type : NameUrlData
}

struct PokemonSpritesData : Decodable {
  let frontDefault: String
  
  enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
  }
}

struct PokemonAbilityData : Decodable {
  let ability : NameUrlData
}
