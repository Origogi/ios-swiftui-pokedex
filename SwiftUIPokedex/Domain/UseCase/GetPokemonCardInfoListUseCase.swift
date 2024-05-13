//
//  GetPokemonListCardInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/3/24.
//

import Foundation

class GetPokemonCardInfoListUseCase {
  
  private let pokemonInfoRepository : PokemonDataRepository = PokemonDataRepository()
  private let pokemonListDataRepository : PokemonListDataRepository = PokemonListDataRepository()
  private let pokemonDetailDataRepository : PokemonDetailDataRepository = PokemonDetailDataRepository()

  
  func execute(offset : Int, limit : Int) async -> [PokemonCardInfo] {
    // Retrieve data: either filtered by type or all entries
    guard let response = await pokemonListDataRepository.list(offset: offset, limit: limit) else {
      return []
    }
    
    print("response : \(response)")
    
    var pokemonCardInfos = [PokemonCardInfo]()
    
    await withTaskGroup(of: PokemonCardInfo?.self) { group in
      for item in response.results {
        group.addTask {
          if let detailData = await self.pokemonDetailDataRepository.get(name: item.name) {
                        
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
    }
    return pokemonCardInfos
  }
}
