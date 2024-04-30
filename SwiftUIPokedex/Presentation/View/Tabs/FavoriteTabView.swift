//
//  FavoritePageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct FavoriteTabView: View {
  
  @ObservedObject var viewModel: FavoriteTabViewModel
  
  var body: some View {
    if viewModel.list.isEmpty {
      EmptyView()
    } else {
      ScrollView {
        LazyVStack {
          ForEach(viewModel.list) { info in
            NavigationLink(
              destination: PokemonDetailScreen(
                viewModel: PokemonDetailViewModel(
                  pokemonId: info.pokedexId
                )
              )
            ) {
              PokemonCard(info: info)
                .padding(.horizontal, 16)
            }
          }
        }
      }
    }
  }
}

private struct EmptyView : View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Favorites")
        .customTextStyle(font: .title2)
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
      Divider()
      Spacer()
      VStack(alignment: .center, spacing: 0) {
        Image("NoFavoriteBackground")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 215, height: 215)
          .padding(.bottom, 16)
        Text("You haven't favorited any Pokémon :(")
          .customTextStyle(font: .title1)
          .multilineTextAlignment(.center)
          .lineLimit(nil) // Ensure unlimited number of lines
          .fixedSize(horizontal: false, vertical: true) // Allow vertical expansion
          .padding(.horizontal, 16)
          .padding(.bottom, 8)
        Text("Click on the heart icon of your favorite Pokémon and they will appear here.")
          .customTextStyle(font: .desc)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
        
      }
      .frame(
        maxWidth: .infinity
      )
      Spacer()
    }
  }
}

#Preview {
    FavoriteTabView(
        viewModel: FavoriteTabViewModel()
    )
}
