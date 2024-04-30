//
//  PokemonCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI

struct PokemonCard: View {
  let info : PokemonCardInfo
  
  var body: some View {
    ZStack {
      HStack {
        VStack(alignment: .leading, spacing: 0) {
          Text(info.pokedexId.pokemonNum())
            .font(.custom("Poppins-SemiBold", size: 12))
            .foregroundColor(
              Color(hex : "#333333")
            )
          Text(info.name)
            .font(.custom("Poppins-SemiBold", size: 21)
            )
            .foregroundColor(
              Color(hex : "#000000")
            )
          Spacer()
          HStack(spacing : 4) {
            ForEach(info.types, id: \.self) { type in
              ElementTypeChip(type: type, fontSize: 11, iconSize: 20, innerHPadding: 7, innerVPadding: 3)
            }
          }
          
        }
        .padding(.leading, 16)
        .padding(.vertical, 12)
        Spacer()
        ZStack { // ZStack의 정렬을 우측 상단으로 설정
          PokemonTypeCard(type: info.mainType)
            .frame(width: 126, height: 100)
            .background(info.mainType.primaryColor)
            .cornerRadius(15)
          Image(info.imagePath)
            .resizable()
            .scaledToFit()
            .padding(4)
          
          HStack {
            Spacer()
            VStack {
              SmallFavButton(viewModel: FavoriteButtonViewModel(
                id : info.pokedexId
              ))
              .padding(6)
              Spacer()
            }
          }
        }.frame(maxWidth: 126, maxHeight: 100)
      }
    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
      .background(info.mainType.secondaryColor)
      .cornerRadius(15)
    
  }
}


struct PokemonSamllCard : View {
  let info : PokemonCardInfo
  var body: some View {
    HStack {
      ZStack {
        PokemonTypeCard(type: info.mainType)
          .frame(width: 94, height: 74)
          .background(info.mainType.primaryColor)
          .cornerRadius(71)
        Image(info.imagePath)
          .resizable()
          .scaledToFit()
          .frame(width: 65, height: 65)
          .padding(4)
      }
      VStack(alignment: .leading, spacing: 4) {
        Text(info.name)
          .font(.custom("Poppins-Medium", size: 16))
          .foregroundColor(Color(hex: "#1A1A1A"))
        Text(info.pokedexId.pokemonNum())
          .font(.custom("Poppins-SemiBold", size: 12))
          .foregroundColor(
            Color(hex : "#4D4D4D")
          )
        HStack(spacing : 4) {
          ForEach(info.types, id: \.self) { type in
            PkoemonTypeChip(type: type)
              .frame(maxWidth: .infinity, maxHeight: 14)
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
    PokemonCard(info: PokemonCardInfo(
      pokedexId: 1,
      name: "Name",
      imagePath: "1_medium",
      types: [
        .bug,
        .dark,
      ]))
    PokemonSamllCard(info: PokemonCardInfo(
      pokedexId: 1,
      name: "Name",
      imagePath: "1_small",
      types: [
        .bug,
        .dark,
      ]))
    PokemonSamllCard(info: PokemonCardInfo(
      pokedexId: 1,
      name: "Name",
      imagePath: "2_small",
      types: [
        .bug,
        .dark,
      ]))
    PokemonSamllCard(info: PokemonCardInfo(
      pokedexId: 1,
      name: "Name",
      imagePath: "3_small",
      types: [
        .bug,
        .dark,
      ]))
  }
}
