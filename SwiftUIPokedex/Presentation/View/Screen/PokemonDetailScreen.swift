//
//  PokemonDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/29/24.
//

import SwiftUI

struct PokemonDetailScreen: View {
  
  @ObservedObject var viewModel: PokemonDetailViewModel
  
  
  init(viewModel: PokemonDetailViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {    
    VStack {
      if let poekmonInfo = viewModel.pokemonDetailInfo {
        GeometryReader { geometry in
          ScrollView {
            LazyVStack(alignment: .leading) {
              ZStack {
                Circle()
                  .frame(width: 500, height: 500) // 원의 크기를 설정합니다.
                  .offset(y: -260) // 원을 상단으로 이동시켜 반원 효과를 생성합니다.
                  .padding(.bottom, -230)
                Rectangle()
                  .offset(y: -300)
                
                Image(poekmonInfo.mainType.smallImagePath)
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
                    detailImageInfo: poekmonInfo.detailImageInfo
                  )
                }
                
              }
              .frame(width: geometry.size.width, height: 280)
              .foregroundColor(poekmonInfo.mainType.primaryColor)
              
              VStack(alignment: .leading) {
                Text(poekmonInfo.name)
                  .font(.custom("Poppins-Medium", size: 32))
                Text(poekmonInfo.id.pokemonNum())
                  .font(.custom("Poppins-Medium", size: 16))
                  .foregroundColor(Color(hex: "#333333"))
                HStack(spacing : 7) {
                  ForEach(poekmonInfo.types, id: \.self) { type in
                    ElementTypeChip(type: type, fontSize: 14, iconSize: 28, innerHPadding: 14, innerVPadding : 4)
                  }
                }
                Spacer()
                  .frame(height: 24)
                Text(poekmonInfo.description)
                  .font(.custom("Poppins-Regular", size: 14))
                  .foregroundColor(Color(hex: "#333333").opacity(0.7))
                Divider()
                  .padding(.vertical, 16)
                StatusGroupView(
                  weight: poekmonInfo.weight,
                  height: poekmonInfo.height,
                  category: poekmonInfo.category,
                  abilities: poekmonInfo.abilities
                )
                .padding(.bottom, 19)
                GenderRatioView(ratio: poekmonInfo.genderRatio)
                  .padding(.bottom , 40)
                WeaknessesView(types: poekmonInfo.weaknesses)
                  .padding(.bottom, 40)
                EvolutionsInfoView(
                  evolutionsInfo: poekmonInfo.evolutionsData
                )
              }
              .padding(.horizontal, 16)
              .padding(.top, 10)
              
              
              Spacer()
            }
          }
          
        }
      }
    }
    .navigationBarHidden(true)
    .onAppear {
      viewModel.load()
    }
  }
    
    
}


struct PokemonStausInfosView: View {
  let pokemon: PokemonData
  
  init(pokemon: PokemonData) {
    self.pokemon = pokemon
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  
  PokemonDetailScreen(
    viewModel: PokemonDetailViewModel(
      getPokemonInfoUseCase: GetPokemonInfoUseCase(
        pokemonInfoRepository: PokemonDataRepository()
      ),
      getEvolutionsInfoUseCase: GetEvolutionsInfoUseCase(
        pokemonEvolutionsDataRepository: PokemonEvolutiosDataRepository(),
        pokemonInfoRepository: PokemonDataRepository()
      ),
      pokemonId: 1
    )
  )
}
