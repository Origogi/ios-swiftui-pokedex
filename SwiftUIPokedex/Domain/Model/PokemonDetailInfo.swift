//
//  PokemonDetailInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

struct PokemonDetailInfo {
  let id : Int
  let name : String
  let weight: Double
  let height: Double
  let category: String
  let abilities: [String]
  let description : String
  let types : [PokemonTypeInfo]
  let genderRatio : Double?
  let weaknesses : [PokemonTypeInfo]
  let evolutionChain : EvolutionChain
  
  var mainType : PokemonTypeInfo {
    return types.first!
  }
  
  var smallImagePath : String {
    return "\(id)_small"
  }
  
  var mediumImagePath : String {
    return "\(id)_medium"
  }
  
  var detailImageUrl : String {
    return "https://projectpokemon.org/images/normal-sprite/\(name.lowercased()).gif"
  }
}
