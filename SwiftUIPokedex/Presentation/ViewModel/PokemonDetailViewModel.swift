//
//  PokemonDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class PokemonDetailViewModel : ObservableObject {
  
  @Published var pokemonDetailInfo : PokemonDetailInfo?
  
  private let getPokemonInfoUseCase : GetPokemonInfoUseCase = GetPokemonInfoUseCase()
  private let pokemonId : Int
  
  init(pokemonId: Int) {
    self.pokemonId = pokemonId
  }
  
  
  func load() {
    Task {      
      let result = await getPokemonInfoUseCase.execute(id: pokemonId)

      // Update the UI on the main thread
      await MainActor.run {
        self.pokemonDetailInfo = result
      }
    }
  
  }
  
}
