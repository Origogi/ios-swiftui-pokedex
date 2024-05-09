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
  let types : [PokemonTypeData]
  let weight: Double
  let height: Double
  let sprites : PokemonSpritesData
}

struct PokemonTypeData : Decodable {
  let slot : Int
  let type : TypeData
}

struct TypeData : Decodable {
  let name : String
  let url : String
}

struct PokemonSpritesData : Decodable {
  let frontDefault: String
  
  enum CodingKeys: String, CodingKey {
    case frontDefault = "front_default"
  }
}
