//
//  PokemonDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/29/24.
//

import SwiftUI

struct PokemonDetailScreen: View {
  let pokemon: PokemonInfo
  
  @State var isNavigationBarHidden: Bool = true
  
  
  init(pokemon: PokemonInfo) {
    self.pokemon = pokemon
  }
  
  var body: some View {
    
    GeometryReader { geometry in
      // MARK : -
      ScrollView {
        LazyVStack(alignment: .leading) {
          ZStack {
            Circle()
              .frame(width: 500, height: 500) // 원의 크기를 설정합니다.
              .offset(y: -260) // 원을 상단으로 이동시켜 반원 효과를 생성합니다.
              .padding(.bottom, -230)
            Rectangle()
              .offset(y: -300)
            
            Image(pokemon.mainType.smallImagePath)
              .resizable()
              .renderingMode(.template)
              .foregroundStyle(
                LinearGradient(
                  gradient: Gradient(colors: [.white, .white.opacity(0)]),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .offset(y: -15)
              .scaledToFit()
              .frame(width: 220, height: 220)
            VStack(alignment: .center) {
              HStack {
                BackButton()
                Spacer()
                BigFavButton(
                  isFav: .constant(false)
                )
              }
              .padding(.horizontal, 16)
              
              .frame(width: geometry.size.width)
              
              Spacer()
              PokemonDetailImageView(
                detailImageInfo: pokemon.detailImageInfo
              )
            }
            
          }
          .frame(width: geometry.size.width, height: 280)
          .foregroundColor(pokemon.mainType.primaryColor)
          
          VStack(alignment: .leading) {
            Text(pokemon.name)
              .font(.custom("Poppins-Medium", size: 32))
            Text(pokemon.id.pokemonNum())
              .font(.custom("Poppins-Medium", size: 16))
              .foregroundColor(Color(hex: "#333333"))
            HStack(spacing : 7) {
              ForEach(pokemon.types, id: \.self) { type in
                ElementTypeChip(type: type, horizontalPadding: 14, verticalPadding: 4, fontSize: 14, iconSize : 28)
              }
            }
            Spacer()
              .frame(height: 24)
            Text(pokemon.description)
              .font(.custom("Poppins-Regular", size: 14))
              .foregroundColor(Color(hex: "#333333").opacity(0.7))
            Divider()
              .padding(.vertical, 16)
            StatusGroupView(pokemon: pokemon)
              .padding(.bottom, 19)
            GenderRatioView(ratio: pokemon.genderRatio)
              .padding(.bottom , 40)
          }
          .padding(.horizontal, 16)
          .padding(.top, 10)
          
          
          Spacer()
        }
      }
      
    }
    .navigationBarHidden(self.isNavigationBarHidden)
    .onAppear {
      self.isNavigationBarHidden = true
    }
  }
}


struct PokemonStausInfosView: View {
  let pokemon: PokemonInfo
  
  init(pokemon: PokemonInfo) {
    self.pokemon = pokemon
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  PokemonDetailScreen(
    pokemon: AppData().pokemons[0]
  )
}
