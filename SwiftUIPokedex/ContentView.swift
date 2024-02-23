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
  
  @ViewBuilder
  var view: some View {
    switch self {
    case .pokedex: PokedexPageView()
    case .region: RegionPageView()
    case .favorite: FavoritePageView()
    case .profile: ProfilePageView()
    }
  }
}

struct ContentView: View {
  @State private var selectedTab: Tab = .pokedex
  
  var body: some View {
    VStack {
      selectedTab.view
      HStack {
        Spacer()
        ForEach(Tab.allCases, id: \.self) { tab in
          Button(action: {
            if (self.selectedTab != tab) {
              withAnimation {
                self.selectedTab = tab
              }
            }
          }) {
            NavigationButton(
              foregroundColor: .white,
              onImagePath: tab.onImagePath,
              offImagePath: tab.offImagePath,
              isActivated: selectedTab == tab,
              title: tab.title
            )
          }
          Spacer()
        }
        
      }
      .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  ContentView()
}
