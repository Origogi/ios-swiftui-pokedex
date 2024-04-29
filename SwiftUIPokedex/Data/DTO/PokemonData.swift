//
//  PokemonInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import Foundation

struct PokemonData : Hashable, Identifiable {
  
  let id : Int
  let name : String
  let weight: Double?
  let height: Double?
  let category: String?
  let abilities: [String]
  let description : String?
  let detailImageInfo : PokemonDetailImageInfo?
  let types : [ElementTypeInfo]
  let genderRatio : Double?
  let weaknesses : [ElementTypeInfo]
  
  init(
    id: Int,
    name: String,
    weight: Double? = nil,
    height: Double? = nil,
    category: String? = nil,
    abilities: [String] = [],
    description: String? = nil,
    detailImageInfo: PokemonDetailImageInfo? = nil,
    types: [ElementTypeInfo],
    genderRatio: Double? = nil ,
    weaknesses: [ElementTypeInfo] = []) {
      
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
    self.weaknesses = weaknesses
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
  
  var hasDetailInfo : Bool {
    return weight != nil && height != nil && category != nil && abilities.count > 0 && description != nil
  }
  
  
}