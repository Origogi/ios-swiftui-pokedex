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
  var isLoading : Bool = false
  
  private let getPokemonListCardInfosUseCase : GetPokemonCardInfoListUseCase = GetPokemonCardInfoListUseCase()
  private let limit = 20
  private var offset = 0
  
  init() {
    loadMore()
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
  
  func loadMore() {
    if isLoading {
      return
    }
    
    isLoading = true
    
    Task {
      let newList = await getPokemonListCardInfosUseCase.execute(offset: offset, limit: limit)
      
      // Perform sorting on a background thread
      let sortedList = await withCheckedContinuation { continuation in
        var localList = newList
        switch selectedSorting {
        case .idAscending:
          localList.sort { $0.id < $1.id }
        case .idDescending:
          localList.sort { $0.id > $1.id }
        case .nameAscending:
          localList.sort { $0.name < $1.name }
        case .nameDescending:
          localList.sort { $0.name > $1.name }
        }
        continuation.resume(returning: localList)
      }
      
      // Update the UI on the main thread
      await MainActor.run {
        self.list = self.list + sortedList
        isLoading = false
        offset += limit
      }
    }
  }
  
  func load() {
    
    var newList = getPokemonListCardInfosUseCase.execute(type : selectedType)
    switch(selectedSorting) {
    case .idAscending:
      newList.sort { $0.id < $1.id }
    case .idDescending:
      newList.sort { $0.id > $1.id }
    case .nameAscending:
      newList.sort { $0.name < $1.name }
    case .nameDescending:
      newList.sort { $0.name > $1.name }
    }
    
    list = newList
  }
}
