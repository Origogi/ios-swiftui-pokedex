//
//  AppData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import Foundation


class AppData {
  
  let pokemons : [PokemonInfo]
  
  init() {
    self.pokemons = [
      PokemonInfo(
        id: 1,
        name: "Bulbasaur",
        smallImagePath: "1_small",
        mediumImagePath: "1_medium",
        bigImagePath: "1_big",
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 2,
        name: "Ivysaur",
        smallImagePath: "2_small",
        mediumImagePath: "2_medium",
        bigImagePath: "2_big",
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 4,
        name: "Charmander",
        smallImagePath: "4_small",
        mediumImagePath: "4_medium",
        bigImagePath: "4_big",
        types: [
          .fire
        ]
      )
    ]
  }
}
