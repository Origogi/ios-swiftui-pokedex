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

    private func set() -> Set<Int> {
        // Retrieve and decode the array of favorite IDs from UserDefaults, converting to a Set
        let array = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] ?? []
        return Set(array)
    }

    private func update(_ favorites: Set<Int>) {
        // Encode and save the array of favorite IDs to UserDefaults
        UserDefaults.standard.set(Array(favorites), forKey: favoritesKey)
    }

    func list() -> [Int] {
        let favorites = set()
        return Array(favorites)
    }

    func contains(id: Int) -> Bool {
        let favorites = set()
        return favorites.contains(id)
    }

    func add(id: Int) {
        var favorites = set()
        favorites.insert(id)
        update(favorites)
    }

    func remove(id: Int) {
        var favorites = set()
        favorites.remove(id)
        update(favorites)
    }
}
