//
//  FilterringSortingButtons.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import SwiftUI


struct FilteringSortingButtons: View {
  
  @State private var showFilterBottomSheet = false
  @State private var showSortingBottomSheet = false
  
  let selectedType : PokemonTypeInfo?
  let selectedSorting : SortingInfo
  // callback
  let onSelectType: (PokemonTypeInfo?) -> Void
  let onSelectSorting: (SortingInfo) -> Void
  
  
  var body: some View {
    HStack(spacing: 16) {
      
      if let type = selectedType {
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
        title: selectedSorting.title,
        titleColor: .white,
        bgColor: gray800,
        onTap: {
          showSortingBottomSheet.toggle()
          
        }
      )
    }
    .sheet(isPresented: $showFilterBottomSheet) {
      FilterBottomSheetContent(
        isShowing: $showFilterBottomSheet,
        onSelect: onSelectType
      )
      .presentationDetents([.fraction(2/3)])
    }
    .sheet(isPresented: $showSortingBottomSheet) {
      SortingBottomSheetContent(
        isShowing: $showSortingBottomSheet,
        onSelect: onSelectSorting
      )
      .presentationDetents([.height(230)])
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 4)
  }
}
