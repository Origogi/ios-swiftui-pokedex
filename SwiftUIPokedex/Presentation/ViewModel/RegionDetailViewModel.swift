//
//  RegionDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import Foundation

class RegionDetailViewModel : ObservableObject {
  
  @Published var list : [PokemonCardInfo] = []
  @Published var selectedType : PokemonTypeInfo?
  @Published var selectedSorting : SortingInfo = .idAscending
  
  let regionInfo : RegionInfo
  let getPokemonListCardInfosUseCase = GetPokemonCardInfoListUseCase()
  
  init(regionInfo: RegionInfo) {
    self.regionInfo = regionInfo
    load()
    
  }
  
  func load() {
    list = getPokemonListCardInfosUseCase.execute(region: regionInfo.type)
  }
  
  
  func filter(type : PokemonTypeInfo?) {
    if (selectedType == type) {
      return  // Do nothing if the type is the same
    }
    
    selectedType = type
    
    list = getPokemonListCardInfosUseCase.execute(type : type, region: regionInfo.type)
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
