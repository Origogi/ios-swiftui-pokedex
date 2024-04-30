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
  let detailImageInfo : PokemonDetailImageInfo
  let types : [PokemonTypeInfo]
  let genderRatio : Double?
  let weaknesses : [PokemonTypeInfo]
  let evolutionsData : EvolutionsInfo
  
  var mainType : PokemonTypeInfo {
    return types.first!
  }
  
  var smallImagePath : String {
    return "\(id)_small"
  }
  
  var mediumImagePath : String {
    return "\(id)_medium"
  }
}
