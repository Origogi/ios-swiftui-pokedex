//
//  ContentView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/20/24.
//
import SwiftUI

enum Tab: CaseIterable {
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

struct HomeScreen: View {
    @State private var selectedTab: Tab = .pokedex

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                switch selectedTab {
                case .pokedex:
                    PokedexTabView(viewModel: PokemonCardListViewModel(
                        startPokedexId: RegionType.kanto.firstPokemonId,
                        lastPokedexId: RegionType.alola.lastPokemonId
                    ))
                case .region:
                    RegionTabView()
                case .favorite:
                    FavoriteTabView(
                        viewModel: FavoriteTabViewModel()
                    )
                case .profile:
                    ProfileTabView()
                }

                Divider()
                HStack {
                    Spacer()
                    ForEach(Tab.allCases, id: \.self) { tab in

                        TabViewBottomButton(
                            foregroundColor: Color.white,
                            onImagePath: tab.onImagePath,
                            offImagePath: tab.offImagePath,
                            title: tab.title,
                            isActivated: bindingForTab(tab)
                        ).onTapGesture {
                            selectedTab = tab
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
            }
        }
    }

    private func bindingForTab(_ tab: Tab) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.selectedTab == tab },
            set: { isSelected in
                if isSelected { self.selectedTab = tab }
            }
        )
    }
}

#Preview {
    HomeScreen()
}
