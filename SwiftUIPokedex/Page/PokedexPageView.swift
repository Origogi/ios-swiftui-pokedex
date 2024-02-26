//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexPageView: View {
  
  @Environment(AppData.self) private var appData
  var body: some View {
    List(appData.pokemons) { pokemon in
      PokemonCard(pokemonInfo: pokemon)
        .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    
  }
}

#Preview {
  PokedexPageView()
    .environment(AppData())
}
