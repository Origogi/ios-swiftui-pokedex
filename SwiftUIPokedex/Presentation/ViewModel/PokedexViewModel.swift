//
//  PokedexViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/28/24.
//

import Foundation

class PokedexViewModel : ObservableObject {
  
  @Published var filteredInfos : [PokemonCardInfo] = []
  private let getPokemonListCardInfosUseCase : GetPokemonListCardInfosUseCase
  
  init(getPokemonListCardInfosUseCase: GetPokemonListCardInfosUseCase) {
    self.getPokemonListCardInfosUseCase = getPokemonListCardInfosUseCase
  }
  
  func load() {
    filteredInfos = getPokemonListCardInfosUseCase.execute()
  }
}
