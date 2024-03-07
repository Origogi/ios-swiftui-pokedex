//
//  DetailImageInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/7/24.
//

import Foundation

struct PokemonDetailImageInfo : Hashable, Identifiable {
  let id: Int
  
  let width : Double
  let height : Double
  
  var gifFileName : String {
    return "\(id).gif"
  }
}
