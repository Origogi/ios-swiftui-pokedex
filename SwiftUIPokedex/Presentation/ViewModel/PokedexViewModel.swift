//
//  PokedexViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/28/24.
//

import Foundation

class PokedexViewModel : ObservableObject {
  
  @Published var filteredPokemons : [PokemonData]
  private let pokemonInfoRepository : PokemonInfoRepository
  
  init(pokemonInfoRepository: PokemonInfoRepository) {
    self.pokemonInfoRepository = pokemonInfoRepository
    self.filteredPokemons = pokemonInfoRepository.getAll()
  }
}
