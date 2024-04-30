//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @ObservedObject var viewModel: PokedexViewModel
  @State private var showFilterBottomSheet = false
  @State private var showSortingBottomSheet = false

  var body: some View {
    ZStack {
      ScrollView {
        LazyVStack(spacing : 12) {
          HStack(spacing: 16) {
            
            if let type = viewModel.selectedType {
              BottomSheetButton(
                title: type.name,
                titleColor: type.textColorOnPrimaryColorBg,
                bgColor: type.primaryColor,
                onTap: {
                  showFilterBottomSheet.toggle()
                }
              )
            } else {
              BottomSheetButton(
                title: "All Types",
                titleColor: .white,
                bgColor: gray800,
                onTap: {
                  showFilterBottomSheet.toggle()
                }
              )
            }
            
            BottomSheetButton(
              title: "Smallest number",
              titleColor: .white,
              bgColor: gray800,
              onTap: {
                showSortingBottomSheet.toggle()

              }
            )
          }
          .padding(.bottom, 4)
          ForEach(viewModel.list) { info in
            NavigationLink(
              destination: PokemonDetailScreen(
                viewModel: PokemonDetailViewModel(
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
    .sheet(isPresented: $showFilterBottomSheet) {
      FilterBottomSheetContent(
        isShowing: $showFilterBottomSheet,
        onSelect: { selected in
          withAnimation {
            viewModel.filter(type: selected)
          }
        }
      )
      .presentationDetents([.fraction(2/3)])
    }
    .sheet(isPresented: $showSortingBottomSheet) {
      SortingBottomSheetContent(
        isShowing: $showSortingBottomSheet,
        onSelect: { selected in
          withAnimation {
            viewModel.sort(sorting: selected)
          }
        }
      )
      .presentationDetents([.height(230)])
    }

    
  }
}


#Preview {
  NavigationView {
    PokedexTabView(
      viewModel: PokedexViewModel()
    )
  }
}
