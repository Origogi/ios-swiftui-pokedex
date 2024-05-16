//
//  PokemonDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class PokemonDetailViewModel : ObservableObject {
  
  @Published var pokemonDetailInfo : PokemonDetailInfo?
  
  private let getPokemonInfoUseCase : GetPokemonDetailInfoUseCase = GetPokemonDetailInfoUseCase()
  private let pokemonId : Int
  
  init(pokemonId: Int) {
    self.pokemonId = pokemonId
  }
  
  
  func load() {
    Task {
      let result = await getPokemonInfoUseCase.execute(id: pokemonId)
      
      // Ensure updating the UI on the main thread with animation
      await MainActor.run {
        self.pokemonDetailInfo = result
      }
    }
  }
}
