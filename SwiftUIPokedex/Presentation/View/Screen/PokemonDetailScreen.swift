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
    ZStack {
      if let pokemonInfo = viewModel.pokemonDetailInfo {
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
                
                Image(pokemonInfo.mainType.smallImagePath)
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
                
                
                // 움직이는 이미지
                VStack(alignment: .center) {
                  Spacer()
                  PokemonDetailImageView(
                    imageUrl: pokemonInfo.animatedImageUrl,
                    maxWidth: geometry.size.width - 40,
                    maxHeight: 250
                  )
                }
                
                // 탑 버튼
                VStack {
                  HStack {
                    BackButton(type : .v1)
                    Spacer()
                    BigFavButton(viewModel: FavoriteButtonViewModel(id: pokemonInfo.id))
                  }
                  .padding(.top, 8)
                  .padding(.horizontal, 16)
                  .frame(width: geometry.size.width)
                  Spacer()
                }
                
              }
              .frame(width: geometry.size.width, height: 280)
              .foregroundColor(pokemonInfo.mainType.primaryColor)
              
              VStack(alignment: .leading) {
                Text(pokemonInfo.name)
                  .customTextStyle(font: .caption1)
                Text(pokemonInfo.id.pokemonNum())
                  .customTextStyle(font: .caption2)
                HStack(spacing : 7) {
                  ForEach(pokemonInfo.types, id: \.self) { type in
                    PokemonTypeMediumChip(type: type, fontSize: 14, iconSize: 28, innerHPadding: 14, innerVPadding : 4)
                  }
                }
                Spacer()
                  .frame(height: 24)
                Text(pokemonInfo.description)
                  .customTextStyle(font: .desc, color: gray800.opacity(0.8))
                Divider()
                  .padding(.vertical, 16)
                StatusGroupView(
                  weight: pokemonInfo.weight,
                  height: pokemonInfo.height,
                  category: pokemonInfo.category,
                  abilities: pokemonInfo.abilities
                )
                .padding(.bottom, 19)
                GenderRatioView(ratio: pokemonInfo.genderRatio)
                  .padding(.bottom , 40)
                WeaknessesView(types: pokemonInfo.weaknesses)
                  .padding(.bottom, 40)
                EvolutionsInfoView(
                  evolutionChain: pokemonInfo.evolutionChain
                )
              }
              .padding(.horizontal, 16)
              .padding(.top, 10)
              Spacer()
            }
          }
        }
        .transition(.opacity)
      } else {
        PlaceHolderView()
        .transition(.opacity)
      }
    }
    .animation(.easeInOut, value: viewModel.pokemonDetailInfo == nil)
    .navigationBarHidden(true)
    .onAppear {
        viewModel.load()
    }
  }
  
  
}

private struct PlaceHolderView : View {
  
  var body: some View {
    ScrollView {
      GeometryReader { geometry in
        VStack(alignment: .leading) {
          ZStack {
            Circle()
              .frame(width: 500, height: 500) // 원의 크기를 설정합니다.
              .offset(y: -260) // 원을 상단으로 이동시켜 반원 효과를 생성합니다.
              .padding(.bottom, -230)
            Rectangle()
              .offset(y: -300)
            
            // 탑 버튼
            VStack {
              HStack {
                BackButton(type : .v1)
                Spacer()
              }
              .padding(.top, 8)
              .padding(.horizontal, 16)
              .frame(width: geometry.size.width)
              Spacer()
            }
            
          }
          .frame(width: geometry.size.width, height: 280)
          .foregroundColor(.gray)
          VStack(alignment: .leading) {
            ShimmerView()
              .frame(width: 120, height: 48)
              .cornerRadius(8)

            ShimmerView()
              .frame(width: 70, height: 22)
              .cornerRadius(8)
              .padding(.bottom, 24)
            ShimmerView()
              .frame(width: 130, height: 36)
              .cornerRadius(67)
              .padding(.bottom, 24)

            ShimmerView()
              .frame(height: 60)
              .cornerRadius(8)
            Spacer()


          }.padding(.horizontal, 16)
        }
        Spacer()

      }
    }

  }
}

#Preview {
  PlaceHolderView()
}

#Preview {
  
  PokemonDetailScreen(
    viewModel: PokemonDetailViewModel(
      pokemonId: 6
    )
  )
}
