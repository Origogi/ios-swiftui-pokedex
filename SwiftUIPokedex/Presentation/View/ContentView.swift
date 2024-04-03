//
//  ContentView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/20/24.
//
import SwiftUI

enum Tab : CaseIterable {
  case pokedex
  case region
  case favorite
  case profile
  
  var title: String {
    switch self {
    case .pokedex: return "Pokedex"
    case .region: return "Region"
    case .favorite: return "Favorite"
    case .profile: return "Profile"
    }
  }
  
  var onImagePath: String {
    switch self {
    case .pokedex: return "PokedexOn"
    case .region: return "RegionOn"
    case .favorite: return "FavoriteOn"
    case .profile: return "ProfileOn"
    }
  }
  
  var offImagePath: String {
    switch self {
    case .pokedex: return "PokedexOff"
    case .region: return "RegionOff"
    case .favorite: return "FavoriteOff"
    case .profile: return "ProfileOff"
    }
  }
  
}

struct ContentView: View {
  @State private var selectedTab: Tab = .pokedex
  @StateObject var pokedexViewModel = PokedexViewModel(
    getPokemonListCardInfosUseCase: GetPokemonListCardInfosUseCase(
      pokemonInfoRepository: PokemonInfoRepository()
    )
  )
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        TabView(selection: $selectedTab) {
          PokedexTabView(viewModel: pokedexViewModel)
            .tag(Tab.pokedex)
          RegionTabView()
            .tag(Tab.region)
          FavoritePageView()
            .tag(Tab.favorite)
          ProfilePageView()
            .tag(Tab.profile)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        
        Divider()
        HStack {
          Spacer()
          ForEach(Tab.allCases, id: \.self) { tab in
            
            TabViewBottomButton(
              foregroundColor: Color.white,
              onImagePath: tab.onImagePath,
              offImagePath: tab.offImagePath,
              isActivated: selectedTab == tab,
              title: tab.title
            ).onTapGesture {
              withAnimation {
                selectedTab = tab
              }
            }
            Spacer()
          }
          
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
      }
      .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
        Color.clear
          .frame(height: 10)
          .background(Material.bar)
      }
    }
  }
}

#Preview {
  ContentView(
    pokedexViewModel: PokedexViewModel(
      getPokemonListCardInfosUseCase: GetPokemonListCardInfosUseCase(
        pokemonInfoRepository: PokemonInfoRepository()
      )
    )
  )
}
