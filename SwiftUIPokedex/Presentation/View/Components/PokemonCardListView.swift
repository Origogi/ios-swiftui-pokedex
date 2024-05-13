//
//  PokemonCardListView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import SwiftUI

struct PokemonCardListView: View {
  let list : [PokemonCardInfo]
  let needLoadMore: Bool
  // list end appear
  let onListEnd: () -> Void
  
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing : 12) {
        
        ForEach(list) { info in
          NavigationLink(
            destination: PokemonDetailScreen(
              viewModel: PokemonDetailViewModel(
                pokemonId: info.id
              )
            )
          ) {
            PokemonCard(info: info)
          }
        }
        
        if !list.isEmpty && needLoadMore {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 16)
            .onAppear {
              onListEnd()
            }
        }
        
        
      }.padding(.horizontal, 16)
    }
  }
}


#Preview {
  
  
  PokemonCardListView(
    list: [
      PokemonCardInfo(
        id: 1,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 2,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 3,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 4,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      
      PokemonCardInfo(
        id: 5,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 6,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 7,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ]),
      PokemonCardInfo(
        id: 8,
        name: "Name",
        imagePath: "1_medium",
        types: [
          .bug,
          .dark,
        ])
    ], needLoadMore: false) {
      
    }
}

struct LoadingIndicator: View {
  
  @State private var isAnimating = false
  
  var body: some View {
    Image("loading")
      .resizable()
      .frame(width: 40, height: 40)
      .rotationEffect(.degrees(isAnimating ? 360 : 0))
      .onAppear {
        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
          isAnimating = true
        }
      }
  }
}
