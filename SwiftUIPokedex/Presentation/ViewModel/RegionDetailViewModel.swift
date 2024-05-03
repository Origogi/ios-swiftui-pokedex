//
//  RegionDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import Foundation

class RegionDetailViewModel : ObservableObject {
  
  @Published var list : [PokemonCardInfo] = []
  
  let regionInfo : RegionInfo
  let getPokemonListCardInfosUseCase = GetPokemonCardInfoListUseCase()
  
  init(regionInfo: RegionInfo) {
    self.regionInfo = regionInfo
    load()
    
  }
  
  func load() {
    list = getPokemonListCardInfosUseCase.execute(region: regionInfo.type)
  }
}
