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
    isFavorite = repository.contains(id: id)
  }
  
  func refresh() {
    isFavorite = repository.contains(id: pokedexId)
  }
  
  func toggleFavorite() {
    if repository.contains(id: pokedexId) {
      repository.remove(id: pokedexId)
    } else {
      repository.add(id: pokedexId)
    }
    
    isFavorite = repository.contains(id: pokedexId)
  }
}
