//
//  RegionCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RegionCard: View {
  
  let region : RegionType
  
  var body: some View {
    ZStack {
      Image(region.bgImagePath)
        .resizable()
        .scaledToFill()
        .frame(maxWidth: .infinity, maxHeight: 115)

      Rectangle()
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(colors: [.black.opacity(0.8), .black.opacity(0.15)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .frame(maxWidth: .infinity, maxHeight: 115)
      HStack {
        VStack(alignment: .leading) {
          Text(region.title)
            .customTextStyle(font: .title2, color: .white)
          Text("\(region.generation)º Generation")
            .customTextStyle(font: .caption4, color: gray200)
        }
        Spacer()
        HStack(spacing: 0) {
          ForEach(region.startingPokemonImagPaths, id: \.self) { pokemon in
            WebImage(url : URL(string: pokemon))
              .resizable()
              .scaledToFit()
              .frame(width: 65, height: 65)
          }
        }
      }
      .padding(.leading, 24)
      .padding(.trailing, 16)
    }
    .cornerRadius(15)
    .frame(height: 115)
  }
}

#Preview {
  RegionCard(
    region: RegionType.kanto
  )
}
