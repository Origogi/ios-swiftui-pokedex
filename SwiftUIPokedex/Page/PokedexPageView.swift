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
        .listRowInsets(.init(top: 6, leading: 0, bottom: 6, trailing: 0))
        .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    .padding(.horizontal, 16)
    
  }
}

#Preview {
  PokedexPageView()
    .environment(AppData())
}
