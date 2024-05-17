//
//  ElementTypeCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI

struct PokemonTypeCard: View {
  let type : PokemonTypeInfo
  
  init(type: PokemonTypeInfo) {
    self.type = type
  }
  
  var body: some View {
    ZStack {
      Image(type.smallImagePath)
        .resizable()
        .renderingMode(.template)
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(colors: [.white, .white.opacity(0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .scaledToFit()
        .padding(.vertical, 4)
    }
  }
}


#Preview {
  List {
    ForEach(PokemonTypeInfo.allCases, id: \.self) { type in
      PokemonTypeCard(type: .bug)
        .frame(width: 126, height: 100)
        .background(type.primaryColor)
        .cornerRadius(15)
    }
  }
}
