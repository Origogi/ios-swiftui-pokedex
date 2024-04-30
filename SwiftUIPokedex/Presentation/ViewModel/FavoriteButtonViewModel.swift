//
//  FavoriteButtonViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import Foundation

class FavoriteButtonViewModel : ObservableObject {
  
  private let repository = PokemonFavoriteDataRepository()
  private let pokedexId : Int;
  
  @Published var isFavorite : Bool
  
  init(id: Int) {
    pokedexId = id
    isFavorite = repository.isFavorite(id: id)
  }
  
  func refresh() {
    isFavorite = repository.isFavorite(id: pokedexId)
  }
  
  func toggleFavorite() {
    if repository.isFavorite(id: pokedexId) {
      repository.removeFavorite(id: pokedexId)
    } else {
      repository.addFavorite(id: pokedexId)
    }
    
    isFavorite = repository.isFavorite(id: pokedexId)
  }
}
