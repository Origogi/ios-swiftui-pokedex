//
//  RegionInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import Foundation

struct RegionInfo : Hashable, Identifiable {
  var id: UUID = UUID()
  
  let bgImagePath: String
  let regionName: String
  let generationNumer : Int
  let startingPokemonImagePath : [String]
}
