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
//      FilteringSortingButtons(
//        selectedType: viewModel.selectedType,
//        selectedSorting: viewModel.selectedSorting,
//        onSelectType: { type in
//          withAnimation {
//            viewModel.filter(type: type)
//          }
//        },
//        onSelectSorting: { sort in
//          withAnimation {
//            viewModel.sort(sorting: sort)
//          }
//        }
//      )
      PokemonCardListView(
        list: viewModel.list,
        needLoadMore: viewModel.needLoadMore
      ) {
        viewModel.loadMore()
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


