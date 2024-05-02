//
//  FavoriteTabViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import Foundation

class FavoriteTabViewModel : ObservableObject {
  
  private let getFavoriteListUseCase = GetFavoriteListUseCase()
  private let removeFavoriteUseCase = RemoveFavoriteUseCase()
  
  @Published var list : [PokemonCardInfo] = []
  
  init() {
    list = getFavoriteListUseCase.execute()
  }
  
  func remove(id : Int) {
    removeFavoriteUseCase.execute(id: id)
    var removedList = list
    removedList.removeAll { $0.pokedexId == id }
    list = removedList
  }
}
