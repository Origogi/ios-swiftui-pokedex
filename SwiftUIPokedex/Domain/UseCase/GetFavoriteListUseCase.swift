//
//  GetFavoriteListUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import Foundation

class GetFavoriteListUseCase {
  
  private let favoriteRepository = PokemonFavoriteDataRepository()
  private let pokemonRepository = PokemonDataRepository()
  
  func execute() -> [PokemonCardInfo] {
    var favoriteIds =  favoriteRepository.list()
    
    favoriteIds.sort {
      pokemonRepository.getById($0).id < pokemonRepository.getById($1).id
    }
    
    return favoriteIds.map { id in
      let pokemonData = pokemonRepository.getById(id)
      
      return PokemonCardInfo(
        id: pokemonData.id,
        name: pokemonData.name,
        imagePath: pokemonData.mediumImagePath,
        types: pokemonData.types
      )
    }
  }
}
