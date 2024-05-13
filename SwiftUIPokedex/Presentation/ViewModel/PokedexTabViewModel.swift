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
}
