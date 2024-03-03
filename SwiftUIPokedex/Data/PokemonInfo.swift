//
//  PokemonInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import Foundation

struct PokemonInfo : Hashable, Identifiable {
  let id : Int
  let name : String
  let weight: Double
  let height: Double
  let category: String
  let abilities: String
  let description : String

  let types : [ElementTypeInfo]
  
  var mainType : ElementTypeInfo {
    return types.first!
  }
  
  var smallImagePath : String {
    return "\(id)_small"
  }
  
  var mediumImagePath : String {
    return "\(id)_medium"
  }
  
  var bigImagePath : String {
    return "\(id)_big"
  }
  
}
