//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @ObservedObject var viewModel: PokedexTabViewModel
  
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
        list: viewModel.list
      ) {
        viewModel.loadMore()
      }
    }
  }
}


#Preview {
  NavigationView {
    PokedexTabView(
      viewModel: PokedexTabViewModel()
    )
  }
}


