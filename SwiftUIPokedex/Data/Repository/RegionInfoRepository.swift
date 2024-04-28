//
//  RegionInfoRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import Foundation

class RegionInfoRepository {
  private let data = [
    RegionInfo(bgImagePath: "kanto", regionName: "Kanto", generationNumer: 1, startingPokemonImagePath: ["1_small", "4_small", "7_small"]),
    RegionInfo(bgImagePath: "johto", regionName: "Johto", generationNumer: 2, startingPokemonImagePath: ["152_small", "155_small", "158_small"]),
    RegionInfo(bgImagePath: "hoenn", regionName: "Hoenn", generationNumer: 3, startingPokemonImagePath: ["252_small", "255_small", "258_small"]),
    RegionInfo(bgImagePath: "sinnoh", regionName: "Sinnoh", generationNumer: 4, startingPokemonImagePath: ["387_small", "390_small", "393_small"]),
    RegionInfo(bgImagePath: "unova", regionName: "Unova", generationNumer: 5, startingPokemonImagePath: ["495_small", "498_small", "501_small"]),
    RegionInfo(bgImagePath: "kalos", regionName: "Kalos", generationNumer: 6, startingPokemonImagePath: ["650_small", "653_small", "656_small"]),
    RegionInfo(bgImagePath: "alola", regionName: "Alola", generationNumer: 7, startingPokemonImagePath: ["722_small", "725_small", "728_small"]),
    RegionInfo(bgImagePath: "galar", regionName: "Galar", generationNumer: 8, startingPokemonImagePath: ["810_small", "813_small", "816_small"])
  ]
  
  func getAll() -> [RegionInfo] {
    return data
  }
}
