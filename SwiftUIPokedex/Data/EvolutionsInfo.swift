//
//  EvolutionsInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import Foundation


struct EvolutionsInfo {
  let origin : PokemonInfo
  let evolutionChain : [EvolutionChain]
}

struct EvolutionChain {
  let condition : String
  let evelution : PokemonInfo
}
