//
//  RegionCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/24/24.
//

import SwiftUI

struct RegionCard: View {
  
  let regionInfo : RegionInfo
  
  var body: some View {
    ZStack {
      Image(regionInfo.bgImagePath)
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
          Text(regionInfo.regionName)
            .font(.custom("Poppins-SemiBold", size: 18))
          .foregroundColor(.white)
          Text(" \(regionInfo.generationNumer)º Generation")
            .font(.custom("Poppins-Medium", size: 11))
            .foregroundColor(gray200)
        }
        Spacer()
        HStack(spacing: 0) {
          ForEach(regionInfo.startingPokemonImagePath, id: \.self) { pokemon in
            Image(pokemon)
              .resizable()
              .scaledToFit()
              .frame(width: 55, height: 55)
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
    regionInfo: RegionInfo(
      type: .kanto,
      bgImagePath: "kanto",
      regionName: "Kanto",
      generationNumer: 1,
      startingPokemonImagePath: ["1_small", "4_small", "7_small"]
    )
  )
}
