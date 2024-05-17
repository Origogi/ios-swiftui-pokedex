//
//  RegionTabView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct RegionTabView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Regions")
                .customTextStyle(font: .title2)
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            Divider()

            ScrollView {
                Spacer(minLength: 12)
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(RegionType.allCases) { region in
                        NavigationLink(destination: RegionDetailScreen(
                            viewModel: PokemonCardListViewModel(
                                startPokedexId: region.firstPokemonId,
                                lastPokedexId: region.lastPokemonId
                            ),
                            regionName: region.title
                        )) {
                            RegionCard(region: region)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    RegionTabView()
}
