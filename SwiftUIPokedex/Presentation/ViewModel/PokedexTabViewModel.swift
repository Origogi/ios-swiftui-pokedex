//
//  PokedexViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/28/24.
//

import Foundation

class PokedexTabViewModel : ObservableObject {
  
  @Published var list : [PokemonCardInfo] = []
  @Published var selectedType : PokemonTypeInfo?
  @Published var selectedSorting : SortingInfo = .idAscending
  
  private let getPokemonListCardInfosUseCase : GetPokemonCardInfoListUseCase = GetPokemonCardInfoListUseCase()
  
  init() {
    load()
  }
  
  func load() {
    list = getPokemonListCardInfosUseCase.execute()
  }
  
  func filter(type : PokemonTypeInfo?) {
    if (selectedType == type) {
      return  // Do nothing if the type is the same
    }
    
    selectedType = type
    
    list = getPokemonListCardInfosUseCase.execute(type : type)
  }
  
  func sort(sorting : SortingInfo) {
    if (selectedSorting == sorting) {
      return  // Do nothing if the sorting is the same
    }
    
    selectedSorting = sorting
    var newList = list
    
    switch(sorting) {
    case .idAscending:
      newList.sort { $0.pokedexId < $1.pokedexId }
    case .idDescending:
      newList.sort { $0.pokedexId > $1.pokedexId }
    case .nameAscending:
      newList.sort { $0.name < $1.name }
    case .nameDescending:
      newList.sort { $0.name > $1.name }
    }
    
    list = newList
  }
}
