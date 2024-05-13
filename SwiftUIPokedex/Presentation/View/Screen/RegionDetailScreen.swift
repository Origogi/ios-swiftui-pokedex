//
//  RegionDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import SwiftUI

struct RegionDetailScreen: View {
  @ObservedObject var viewModel: PokemonCardListViewModel
  
  let regionName: String
  
  var body: some View {
    VStack {
      HStack(spacing: 16) {
        BackButton(type: .v2)
        Text(regionName)
          .customTextStyle(font: .title2)
        Spacer()
      }
      .padding(.horizontal, 16)
      
      if viewModel.list.isEmpty {
        ProgressView()
          .frame(            
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
          )
      } else {
        PokemonCardListView(
          list: viewModel.list,
          needLoadMore: viewModel.needLoadMore
        ) {
          viewModel.loadMore()
        }
      }
    }.navigationBarHidden(true)
      .onAppear {
        viewModel.loadMore()
      }
    
  }
}

#Preview {
  RegionDetailScreen(
    viewModel: PokemonCardListViewModel(
      startPokedexId: RegionType.kanto.firstPokemonId,
      lastPokedexId: RegionType.kanto.lastPokemonId),
    regionName: RegionType.kanto.title
  )
}
