//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @Environment(AppData.self) private var appData
  var body: some View {
    ScrollView {
      LazyVStack(spacing : 12) {
        ForEach(appData.pokemons) { pokemon in
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
    PokedexTabView()
      .environment(AppData())
  }
}
