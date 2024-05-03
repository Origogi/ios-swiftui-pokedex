//
//  FavoritePageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct FavoriteTabView: View {
  
  @ObservedObject var viewModel: FavoriteTabViewModel
  @State private var navigateToDetail = false
  @State private var selectedPokemonID: Int?
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("Favorites")
        .customTextStyle(font: .title2)
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
      Divider()
      
      if viewModel.list.isEmpty {
        EmptyView()
      } else {
        NavigationLink(
          destination: PokemonDetailScreen(
            viewModel: PokemonDetailViewModel(pokemonId: selectedPokemonID ?? 1)
          ),
          isActive: $navigateToDetail
        ) {
          Spacer()
            .frame(width: 0, height: 0)
        }
        ScrollView {
          LazyVStack(spacing : 12) {
            Spacer()
              .frame(height: 0)
            ForEach(viewModel.list) { info in
              NavigationLink(
                destination: PokemonDetailScreen(
                  viewModel: PokemonDetailViewModel(
                    pokemonId: info.id
                  )
                )
              ) {
                SwipeableView (
                  content : {
                    PokemonCard(
                      info: info,
                      showFavButton: false
                    )
                  },
                  onDelete: {
                    withAnimation {
                      viewModel.remove(id: info.id)
                    }
                  },
                  onTapAction: {
                    // Set the selected Pokemon ID and trigger navigation
                    selectedPokemonID = info.id
                    navigateToDetail = true
                  }
                )
                .cornerRadius(15)
                .padding(.horizontal, 16)
              }
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
