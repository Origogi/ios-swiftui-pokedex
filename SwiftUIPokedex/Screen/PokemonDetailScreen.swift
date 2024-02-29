//
//  PokemonDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/29/24.
//

import SwiftUI

struct PokemonDetailScreen: View {
  let pokemon: PokemonInfo
  
  init(pokemon: PokemonInfo) {
    self.pokemon = pokemon
  }
  
  var body: some View {
    
    VStack(alignment: .leading) {
      ZStack {
        Circle()
          .frame(width: 500, height: 500) // 원의 크기를 설정합니다.
          .offset(y: -270) // 원을 상단으로 이동시켜 반원 효과를 생성합니다.
          .padding(.bottom, -270) // 패딩을 음수로 설정하여 원의 하단 부분을 숨깁니다.
        
        // 다른 컨텐츠를 여기에 배치할 수 있습니다.
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
      }
      .frame(height: 250)
      .foregroundStyle(
        LinearGradient(
          gradient: Gradient(colors: [pokemon.mainType.primaryColor, pokemon.mainType.primaryColor.opacity(0.5)]),
          startPoint: .topLeading,
          endPoint: .bottomTrailing
        )
      )
      .frame(height: 250)
      VStack {
        Text(pokemon.name)
          .font(.custom("Poppins-Bold", size: 32))
      }.offset(x: 70)

      Spacer()

 
    }
  }
}

#Preview {
  PokemonDetailScreen(
    pokemon: AppData().pokemons[0]
  )
}
