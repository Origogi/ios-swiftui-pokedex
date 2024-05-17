//
//  SmallFavButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/26/24.
//

import SwiftUI

struct SmallFavButton: View {
    @ObservedObject var viewModel: FavoriteButtonViewModel

    var body: some View {
        Button(action: {
            viewModel.toggleFavorite()
        }, label: {
            Image(viewModel.isFavorite ? "SmallFavOn" : "SmallFavOff")
                .resizable()

        })
        .frame(width: 32, height: 32)
        .onAppear {
            viewModel.refresh()
        }
    }
}

#Preview {
    SmallFavButton(
        viewModel: FavoriteButtonViewModel(id: 1)
    )
}
