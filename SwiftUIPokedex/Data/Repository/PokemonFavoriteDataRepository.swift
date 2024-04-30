//
//  PokemonFavoriteDataRepository.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//
import Foundation

class PokemonFavoriteDataRepository {
  
  private let favoritesKey = "favorites"
  
  init() {
    // Ensure the UserDefaults contains a valid array at initialization
    if UserDefaults.standard.array(forKey: favoritesKey) == nil {
      UserDefaults.standard.set([Int](), forKey: favoritesKey)
    }
  }
  
  private func loadFavorites() -> Set<Int> {
    // Retrieve and decode the array of favorite IDs from UserDefaults, converting to a Set
    let array = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] ?? []
    return Set(array)
  }
  
  private func saveFavorites(_ favorites: Set<Int>) {
    // Encode and save the array of favorite IDs to UserDefaults
    UserDefaults.standard.set(Array(favorites), forKey: favoritesKey)
  }
  
  func isFavorite(id: Int) -> Bool {
    let favorites = loadFavorites()
    return favorites.contains(id)
  }
  
  func addFavorite(id: Int) {
    var favorites = loadFavorites()
    favorites.insert(id)
    saveFavorites(favorites)
  }
  
  func removeFavorite(id: Int) {
    var favorites = loadFavorites()
    favorites.remove(id)
    saveFavorites(favorites)
  }
}
