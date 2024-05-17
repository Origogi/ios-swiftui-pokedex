//
//  FavoriteTabView.swift
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
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Favorites")
                    .customTextStyle(font: .title2)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                Divider()

                if let list = viewModel.list {
                    if list.isEmpty {
                        EmptyView()
                    } else {
                        ScrollView {
                            VStack(spacing: 12) {
                                Spacer()
                                    .frame(height: 0)
                                ForEach(list) { info in
                                    SwipeableView(
                                        content: {
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
                } else {
                    ProgressView()
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .center
                        )
                }
            }
            .onAppear {
                viewModel.load()
            }
            .navigationDestination(isPresented: $navigateToDetail) {
                if let pokemonID = selectedPokemonID {
                    PokemonDetailScreen(pokemonId: pokemonID)
                }
            }
        }
    }
}

private struct EmptyView: View {
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
