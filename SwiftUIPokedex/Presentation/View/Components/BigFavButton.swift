//
//  BigFavButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/10/24.
//

import SwiftUI

struct BigFavButton: View {
    @ObservedObject var viewModel: FavoriteButtonViewModel

    var body: some View {
        Button(action: {
            viewModel.toggleFavorite()
        }, label: {
            Image(viewModel.isFavorite ? "BigFavOn" : "BigFavOff")
                .resizable()

        })
        .frame(width: 28, height: 28)
    }
}

#Preview {
    BigFavButton(
        viewModel: FavoriteButtonViewModel(id: 1)
    )
}
