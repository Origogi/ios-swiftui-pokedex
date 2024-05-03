//
//  PokemonCardListView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import SwiftUI

struct PokemonCardListView: View {
  let list : [PokemonCardInfo]
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing : 12) {
        
        ForEach(list) { info in
          NavigationLink(
            destination: PokemonDetailScreen(
              viewModel: PokemonDetailViewModel(
                pokemonId: info.id
              )
            )
          ) {
            PokemonCard(info: info)
          }
        }
      }.padding(.horizontal, 16)
    }
    .animation(.default, value: list)

  }
}

#Preview {
  
  
  PokemonCardListView(
    list: [
      PokemonCardInfo(
        id: 1,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 1,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 1,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 1,
          name: "Name",
          imagePath: "1_medium",
          types: [
            .bug,
            .dark,
          ])
    ])
}
