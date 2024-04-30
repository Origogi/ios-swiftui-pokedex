//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @ObservedObject var viewModel: PokedexViewModel
  @State private var showBottomSheet = false
  
  var body: some View {
    ZStack {
      ScrollView {
        LazyVStack(spacing : 12) {
          HStack(spacing: 16) {
            BottomSheetButton(
              title: "All types",
              onTap: {
                showBottomSheet.toggle()
              }
            )
            BottomSheetButton(
              title: "Smallest number",
              onTap: {
              }
            )
          }
          .padding(.bottom, 4)
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
      }
      
    }
    
    .onAppear {
      viewModel.load()
    }
    .sheet(isPresented: $showBottomSheet) {
      FilterByTypeBottomSheetContent(
        isShowing: $showBottomSheet,
        onSelect: { selected in
          withAnimation {
            viewModel.filter(type: selected)
          }
        }
      )
      .presentationDetents([.fraction(2/3)])
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
