//
//  PokemonDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/29/24.
//

import SwiftUI

struct PokemonDetailScreen: View {
    let pokemon: PokemonInfo
  
  init(pokemon: PokemonInfo) {
    self.pokemon = pokemon
  }
  
    var body: some View {
      Text(pokemon.name)
    }
}

#Preview {
    PokemonDetailScreen(
      pokemon: AppData().pokemons[0]
    )
}
