//
//  PokedexViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/28/24.
//

import Foundation

class PokedexViewModel : ObservableObject {
  
  @Published var filteredInfos : [PokemonCardInfo] = []
  @Published var selectedType : PokemonTypeInfo?
  
  private let getPokemonListCardInfosUseCase : GetPokemonListCardInfosUseCase
  
  init(getPokemonListCardInfosUseCase: GetPokemonListCardInfosUseCase) {
    self.getPokemonListCardInfosUseCase = getPokemonListCardInfosUseCase
    load()
  }
  
  func load() {
    filteredInfos = getPokemonListCardInfosUseCase.execute()
  }
  
  func filter(type : PokemonTypeInfo?) {
    if (selectedType == type) {
      return  // Do nothing if the type is the same
    }
    
    selectedType = type
    
    filteredInfos = getPokemonListCardInfosUseCase.execute(type : type)
  }
}
