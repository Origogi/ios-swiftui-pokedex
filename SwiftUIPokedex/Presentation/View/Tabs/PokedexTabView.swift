//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @ObservedObject var viewModel: PokedexViewModel
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing : 12) {
        HStack(spacing: 16) {
          BottomSheetButton(
            title: "All types",
            onTap: {
            }
          )
          BottomSheetButton(
            title: "Smallest number",
            onTap: {
            }
          )
        }
        
        ForEach(viewModel.filteredInfos) { info in
          NavigationLink(
            destination: PokemonDetailScreen(
              viewModel: PokemonDetailViewModel(
                getPokemonInfoUseCase: GetPokemonInfoUseCase(
                  pokemonInfoRepository: PokemonDataRepository()
                ),
                getEvolutionsInfoUseCase: GetEvolutionsInfoUseCase(
                  pokemonEvolutionsDataRepository: PokemonEvolutiosDataRepository(),
                  pokemonInfoRepository: PokemonDataRepository()
                ),
                pokemonId: info.pokedexId
              )
            )
          ) {
            PokemonCard(info: info)
          }
        }
      }.padding(.horizontal, 16)
    }.onAppear {
      viewModel.load()
    }
  }
}

#Preview {
  NavigationView {
    PokedexTabView(
      viewModel: PokedexViewModel(
        getPokemonListCardInfosUseCase: GetPokemonListCardInfosUseCase(
          pokemonInfoRepository: PokemonDataRepository()
        )
      )
    )
  }
}
