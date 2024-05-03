//
//  WeaknessesView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/17/24.
//

import SwiftUI

struct WeaknessesView: View {
  let types : [PokemonTypeInfo]
  
  var body: some View {
    // 2 columns
    let columns: [GridItem] = [
      GridItem(.flexible(), spacing: 16),
      GridItem(.flexible(), spacing: 16)
    ]
    VStack(alignment: .leading, spacing: 12) {
      Text("Weaknesses")
        .font(.custom("Poppins-Medium", size: 18))
      LazyVGrid(columns: columns, spacing: 12) {
        ForEach(types, id: \.self) { type in
          PokemonTypeMediumChip(type: type, fontSize: 14, iconSize: 28, innerVPadding: 4)
          
        }
      }
    }
    
  }
}

#Preview {
  WeaknessesView(
    types: [
      .ice,
      .fire,
      .water,
      .electric,
      .grass,
      .ice,
      .psychic,
    ]
  )
}
