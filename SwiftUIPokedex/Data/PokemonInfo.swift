//
//  PokemonInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import Foundation

struct PokemonInfo : Hashable {
  let id : Int
  let name : String
  let smallImagePath : String
  let mediumImagePath : String
  let bigImagePath : String
  let types : [ElementTypeInfo]
  
  var mainType : ElementTypeInfo {
    return types.first!
  }
  
  
}
