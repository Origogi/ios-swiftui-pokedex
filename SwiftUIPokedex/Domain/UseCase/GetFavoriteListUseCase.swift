//
//  GetFavoriteListUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import Foundation

class GetFavoriteListUseCase {
  
  private let favoriteRepository = PokemonFavoriteDataRepository()
  private let pokemonDetailDataRepository = PokemonDetailDataRepository()
  
  func execute() async -> [PokemonCardInfo] {
    var favoriteIds =  favoriteRepository.list()
    
    var pokemonCardInfos = [PokemonCardInfo]()
    
    await withTaskGroup(of: PokemonCardInfo?.self) { group in
      for id in favoriteIds {
        group.addTask {
          if let detailData = await self.pokemonDetailDataRepository.get(id: id) {
            
            return PokemonCardInfo(
              id: detailData.id,
              name: detailData.name.capitalized,
              imagePath: detailData.sprites.frontDefault,
              types: detailData.types.map { type in
                return PokemonTypeInfo(rawValue: type.type.name.capitalized) ?? .normal
              }
            )
          }
          return nil
        }
      }
      
      // 결과를 취합
      for await result in group {
        if let cardInfo = result {
          pokemonCardInfos.append(cardInfo)
        }
      }
      
      pokemonCardInfos.sort { $0.id < $1.id }
    }

    return pokemonCardInfos
  }
}
