//
//  PokemonCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PokemonCard: View {
  let info : PokemonCardInfo
  let showFavButton : Bool
  
  init (info : PokemonCardInfo, showFavButton : Bool = true) {
    self.info = info
    self.showFavButton = showFavButton
  }
  
  var body: some View {
    ZStack {
      HStack {
        VStack(alignment: .leading, spacing: 0) {
          Text(info.id.pokemonNum())
            .customTextStyle(font: .title4)
          Text(info.name)
            .customTextStyle(font: .title1, color: .black)
          Spacer()
          HStack(spacing : 4) {
            ForEach(info.types, id: \.self) { type in
              PokemonTypeMediumChip(type: type, fontSize: 11, iconSize: 20, innerHPadding: 7, innerVPadding: 3)
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
          WebImage(url: URL(string: info.imagePath))
            .resizable()
            .scaledToFit()
            .padding(4)
          
          if showFavButton {
            HStack {
              Spacer()
              VStack {
                SmallFavButton(viewModel: FavoriteButtonViewModel(
                  id : info.id
                ))
                .padding(6)
                Spacer()
              }
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
        WebImage(url: URL(string: info.imagePath))
          .resizable()
          .scaledToFit()
          .frame(width: 65, height: 65)
          .padding(4)
      }
      VStack(alignment: .leading, spacing: 4) {
        Text(info.name)
          .customTextStyle(font: .caption2, color : gray900)
        Text(info.id.pokemonNum())
          .customTextStyle(font: .caption4, color : gray700)
        HStack(spacing : 4) {
          ForEach(info.types, id: \.self) { type in
            PokemonTypeSmallChip(type: type)
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
        .stroke(gray100, lineWidth: 1) // Border with blue color and 2 points width
    )
  }
}

#Preview {
  
  VStack {
    PokemonCard(info: PokemonCardInfo(
      id: 1,
      name: "Name",
      imagePath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      types: [
        .bug,
        .dark,
      ]))
    PokemonCard(info: PokemonCardInfo(
      id: 1,
      name: "Name",
      imagePath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      types: [
        .bug,
        .dark,
      ]),
                showFavButton: false
    )
    PokemonSamllCard(info: PokemonCardInfo(
      id: 1,
      name: "Name",
      imagePath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      types: [
        .bug,
        .dark,
      ]))
    PokemonSamllCard(info: PokemonCardInfo(
      id: 1,
      name: "Name",
      imagePath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      types: [
        .bug,
        .dark,
      ]))
    PokemonSamllCard(info: PokemonCardInfo(
      id: 1,
      name: "Name",
      imagePath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
      types: [
        .bug,
        .dark,
      ]))
  }
}
