//
//  PokedexViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/28/24.
//

import Foundation

class PokemonCardListViewModel : ObservableObject {
  
  @Published var list : [PokemonCardInfo] = []
  @Published var needLoadMore : Bool = true

  var isLoading : Bool = false
  
  private let getPokemonListCardInfosUseCase : GetPokemonCardInfoListUseCase = GetPokemonCardInfoListUseCase()
  
  private let limit = 20
  
  private var offset : Int
  private let lastPokedexId : Int
  
  init(startPokedexId: Int, lastPokedexId : Int) {
    offset = startPokedexId
    self.lastPokedexId = lastPokedexId
  }

  func loadMore() {
    if isLoading {
      return
    }
    
    isLoading = true
    
    Task {
      let newList = await getPokemonListCardInfosUseCase.execute(
        offset: offset, limit: limit)
      
      // Perform sorting on a background thread
      let result = await withCheckedContinuation { continuation in
        var localList = newList
        localList.sort { $0.id < $1.id }
        let filterdList = localList.filter {
          $0.id <= lastPokedexId
        }
        continuation.resume(returning: filterdList)
      }
      
      // Update the UI on the main thread
      await MainActor.run {
        self.list = self.list + result
        self.needLoadMore = (self.list.last?.id ?? 0) != lastPokedexId
        isLoading = false
        offset += result.count
      }
    }
  }
}
