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
  let abilities: [String]
  let description : String
  let detailImageInfo : PokemonDetailImageInfo
  let types : [ElementTypeInfo]
  let genderRatio : Double?
  
  init(id: Int, name: String, weight: Double, height: Double, category: String, abilities: [String], description: String, detailImageInfo: PokemonDetailImageInfo, types: [ElementTypeInfo], genderRatio: Double? = nil) {
    self.id = id
    self.name = name
    self.weight = weight
    self.height = height
    self.category = category
    self.abilities = abilities
    self.description = description
    self.detailImageInfo = detailImageInfo
    self.types = types
    self.genderRatio = genderRatio
  }
  
  
  var mainType : ElementTypeInfo {
    return types.first!
  }
  
  var smallImagePath : String {
    return "\(id)_small"
  }
  
  var mediumImagePath : String {
    return "\(id)_medium"
  }
  
  
}
