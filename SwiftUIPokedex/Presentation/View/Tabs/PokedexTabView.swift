//
//  PokedexTabView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct PokedexTabView: View {
    @ObservedObject var viewModel: PokemonCardListViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Pokedex")
                .customTextStyle(font: .title2)
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
            Divider()

            if viewModel.list.isEmpty {
                ProgressView()
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    )
            } else {
                PokemonCardListView(
                    list: viewModel.list,
                    needLoadMore: viewModel.needLoadMore
                ) {
                    viewModel.loadMore()
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        PokedexTabView(
            viewModel: PokemonCardListViewModel(
                startPokedexId: 1,
                lastPokedexId: 20
            )
        )
    }
}
