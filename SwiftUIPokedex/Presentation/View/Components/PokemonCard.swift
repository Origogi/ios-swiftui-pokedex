//
//  PokemonCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI

struct PokemonCard: View {
  let pokemonInfo : PokemonData
  
  var body: some View {
    ZStack {
      HStack {
        VStack(alignment: .leading, spacing: 0) {
          Text(pokemonInfo.id.pokemonNum())
            .font(.custom("Poppins-SemiBold", size: 12))
            .foregroundColor(
              Color(hex : "#333333")
            )
          Text(pokemonInfo.name)
            .font(.custom("Poppins-SemiBold", size: 21)
            )
            .foregroundColor(
              Color(hex : "#000000")
            )
          Spacer()
          HStack(spacing : 4) {
            ForEach(pokemonInfo.types, id: \.self) { type in
              ElementTypeChip(type: type, fontSize: 11, iconSize: 20, innerHPadding: 7, innerVPadding: 3)
            }
          }
          
        }
        .padding(.leading, 16)
        .padding(.vertical, 12)
        Spacer()
        ZStack { // ZStack의 정렬을 우측 상단으로 설정
          ElementTypeCard(type: pokemonInfo.mainType)
            .frame(width: 126, height: 100)
            .background(pokemonInfo.mainType.primaryColor)
            .cornerRadius(15)
          Image(pokemonInfo.mediumImagePath)
            .resizable()
            .scaledToFit()
            .padding(4)
          
          HStack {
            Spacer()
            VStack {
              SmallFavButton(isFav: .constant(false))
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
}


struct PokemonSamllCard : View {
  let pokemon : PokemonData
  var body: some View {
    HStack {
      ZStack {
        ElementTypeCard(type: pokemon.mainType)
          .frame(width: 94, height: 74)
          .background(pokemon.mainType.primaryColor)
          .cornerRadius(71)
      }
      VStack(alignment: .leading, spacing: 4) {
        Text(pokemon.name)
          .font(.custom("Poppins-Medium", size: 16))
          .foregroundColor(Color(hex: "#1A1A1A"))
        Text(pokemon.id.pokemonNum())
          .font(.custom("Poppins-SemiBold", size: 12))
          .foregroundColor(
            Color(hex : "#4D4D4D")
          )
        HStack(spacing : 4) {
          ForEach(pokemon.types, id: \.self) { type in
            ElementTypeSmallChip(type: type)
              .frame(width: .infinity, height: 14)
          }
          Spacer()
            .frame(width: 48)
        }
      }
      Spacer()
    }
    .overlay(
      RoundedRectangle(cornerRadius: 90) // Rounded rectangle shape
        .stroke(Color(hex: "#E6E6E6"), lineWidth: 1) // Border with blue color and 2 points width
    )
  }
}

#Preview {
  
  List {
    ForEach(PokemonInfoRepository().getAll(), id: \.self) { info in
      PokemonSamllCard(pokemon: info)
    }
  }
}
