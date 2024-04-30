//
//  FavoriteTabViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import Foundation

class FavoriteTabViewModel : ObservableObject {
  
  private let useCase = GetFavoriteListUseCase()
  
  @Published var list : [PokemonCardInfo] = []
  
  init() {
    list = useCase.execute()
  }
}
