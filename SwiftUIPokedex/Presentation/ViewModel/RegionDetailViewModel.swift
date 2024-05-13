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
  
  func filter(type : PokemonTypeInfo?) {
    if (selectedType == type) {
      return  // Do nothing if the type is the same
    }
    
    selectedType = type
    load()
  }
  
  func sort(sorting : SortingInfo) {
    if (selectedSorting == sorting) {
      return  // Do nothing if the sorting is the same
    }
    
    selectedSorting = sorting
    load()
  }
  
  func load() {
    
//    var newList = getPokemonListCardInfosUseCase.execute(type : selectedType, region: regionInfo.type)
//    switch(selectedSorting) {
//    case .idAscending:
//      newList.sort { $0.id < $1.id }
//    case .idDescending:
//      newList.sort { $0.id > $1.id }
//    case .nameAscending:
//      newList.sort { $0.name < $1.name }
//    case .nameDescending:
//      newList.sort { $0.name > $1.name }
//    }
//    
//    list = newList
  }
}
