//
//  RegionInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import Foundation

struct RegionInfo : Hashable, Identifiable {
  var id: UUID = UUID()
  let type: RegionType
  let bgImagePath: String
  let regionName: String
  let generationNumer : Int
  let startingPokemonImagePath : [String]
}

enum RegionType : Hashable {
  case kanto
  case johto
  case hoenn
  case sinnoh
  case unova
  case kalos
  case alola
  case galar
}
