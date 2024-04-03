//
//  PokemonListCardInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/3/24.
//

import Foundation

struct PokemonCardInfo : Identifiable, Equatable, Hashable {

  let id = UUID()
  let pokedexId : Int
  let name : String
  let imagePath : String
  let types : [ElementTypeInfo]
  
  var mainType : ElementTypeInfo {
    return types.first!
  }
}
