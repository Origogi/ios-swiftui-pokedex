//
//  PokemonCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI

struct PokemonCard: View {
  let pokemonInfo : PokemonInfo
  
  var body: some View {
    ZStack {
      HStack {
        VStack(alignment: .leading, spacing: 0) {
          Text(formatNumber(pokemonInfo.id))
            .font(.custom("Poppins-SemiBold", size: 12))
            .foregroundColor(
              Color(hex : "#333333")
            )
          Text(pokemonInfo.name)
            .font(.custom("Poppins-SemiBold", size: 21))
          Spacer()
          HStack {
            ForEach(pokemonInfo.types, id: \.self) { type in
              ElementTypeChip(type: type)
            }
          }
         
        }
        .padding(.leading, 16)
        .padding(.vertical, 12)
        Spacer()
        ZStack { // ZStack의 정렬을 우측 상단으로 설정
          ElementTypeCard(type: pokemonInfo.mainType)
          Image(pokemonInfo.mediumImagePath)
            .resizable()
            .scaledToFit()
            .padding(4)
          
          HStack {
            Spacer()
            VStack {
              FabButton(isFav: .constant(false))
                .padding(6)
              Spacer()
            }
          }
        }.frame(maxWidth: 126, maxHeight: 100)
      }
    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
      .background(pokemonInfo.mainType.secondaryColor)
      .cornerRadius(15)
    
  }
  
  func formatNumber(_ number: Int) -> String {
    return String(format: "Nº%03d", number)
  }
}

#Preview {
  
  List {
    ForEach(AppData().pokemons, id: \.self) { info in
      PokemonCard(pokemonInfo: info)
    }
  }
}
