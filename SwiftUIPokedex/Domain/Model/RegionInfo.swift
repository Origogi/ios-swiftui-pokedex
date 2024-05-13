//
//  RegionInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import Foundation

enum RegionType : CaseIterable , Identifiable {
  case kanto
  case johto
  case hoenn
  case sinnoh
  case unova
  case kalos
  case alola
  
  var id: String { self.title }

  var pokedexIdRange : ClosedRange<Int> {
    switch self {
    case .kanto:
      return 1...151
    case .johto:
      return 152...251
    case .hoenn:
      return 252...386
    case .sinnoh:
      return 387...493
    case .unova:
      return 494...649
    case .kalos:
      return 650...721
    case .alola:
      return 722...807
    }
  }
  
  var firstGeneration : RegionType {
    return .kanto
  }
  
  var lastGeneration : RegionType {
    return .alola
  }
  
  var firstPokemonId : Int {
    return pokedexIdRange.lowerBound
  }
  
  var lastPokemonId : Int {
    return pokedexIdRange.upperBound
  }
  
  // title
  var title: String {
    switch self {
    case .kanto:
      return "Kanto"
    case .johto:
      return "Johto"
    case .hoenn:
      return "Hoenn"
    case .sinnoh:
      return "Sinnoh"
    case .unova:
      return "Unova"
    case .kalos:
      return "Kalos"
    case .alola:
      return "Alola"
    }
  }
  
  var generation: Int {
    switch self {
    case .kanto:
      return 1
    case .johto:
      return 2
    case .hoenn:
      return 3
    case .sinnoh:
      return 4
    case .unova:
      return 5
    case .kalos:
      return 6
    case .alola:
      return 7
    }
  }
  
  var bgImagePath : String {
    switch self {
    case .kanto:
      return "kanto"
    case .johto:
      return "johto"
    case .hoenn:
      return "hoenn"
    case .sinnoh:
      return "sinnoh"
    case .unova:
      return "unova"
    case .kalos:
      return "kalos"
    case .alola:
      return "alola"
    }
  }
  
  var startingPokemonImagPaths:  [String]  {
    switch self {
    case .kanto:
      return ["1_small", "4_small", "7_small"]
    case .johto:
      return ["152_small", "155_small", "158_small"]
    case .hoenn:
      return ["252_small", "255_small", "258_small"]
    case .sinnoh:
      return ["387_small", "390_small", "393_small"]
    case .unova:
      return ["495_small", "498_small", "501_small"]
    case .kalos:
      return ["650_small", "653_small", "656_small"]
    case .alola:
      return ["722_small", "725_small", "728_small"]
    }
  }
}
