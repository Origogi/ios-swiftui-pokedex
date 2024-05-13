//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @ObservedObject var viewModel: PokemonCardListViewModel
  
  var body: some View {
    VStack {
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
      
    }.onAppear {
      viewModel.loadMore()
    }
  }
}


#Preview {
  NavigationView {
    PokedexTabView(
      viewModel: PokemonCardListViewModel(
        startPokedexId: 1,
        lastPokedexId: 20
      )
    )
  }
}


