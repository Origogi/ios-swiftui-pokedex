//
//  PokedexPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
  
  @ObservedObject var viewModel: PokedexTabViewModel
  @State private var showFilterBottomSheet = false
  @State private var showSortingBottomSheet = false

  var body: some View {
    ZStack {
      VStack {
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
            title: viewModel.selectedSorting.title,
            titleColor: .white,
            bgColor: gray800,
            onTap: {
              showSortingBottomSheet.toggle()
              
            }
          )
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 4)
        PokemonCardListView(
          list: viewModel.list
        )
        
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
      viewModel: PokedexTabViewModel()
    )
  }
}


