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
    ScrollView {
      LazyVStack(spacing : 12) {
        ForEach(appData.pokemons) { pokemon in
          PokemonCard(pokemonInfo: pokemon)
        }
      }.padding(.horizontal, 16)
    }
    
  }
}

#Preview {
  PokedexPageView()
    .environment(AppData())
}
