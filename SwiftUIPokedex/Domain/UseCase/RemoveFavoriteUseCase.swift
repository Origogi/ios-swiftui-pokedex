//
//  RemoveFavoriteUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/2/24.
//

import Foundation

class RemoveFavoriteUseCase {
    private let repository = PokemonFavoriteDataRepository()

    func execute(id: Int) {
        repository.remove(id: id)
    }
}
