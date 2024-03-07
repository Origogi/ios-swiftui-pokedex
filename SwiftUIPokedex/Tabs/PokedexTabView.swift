//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  let pokemons : [PokemonInfo]
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing : 12) {
        ForEach(pokemons) { pokemon in
          NavigationLink(destination: PokemonDetailScreen(pokemon: pokemon)) {
            PokemonCard(pokemonInfo: pokemon)
          }
        }
      }.padding(.horizontal, 16)
    }
    
  }
}

#Preview {
  NavigationView {
    PokedexTabView(pokemons : AppData().pokemons)
  }
}
