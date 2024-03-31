//
//  PokemonDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class PokemonDetailViewModel {
  
  @Published var pokemonDetailInfo : PokemonDetailInfo
  
  private let pokemonInfoRepository : PokemonInfoRepository
  private let getEvolutionsInfoUseCase : GetEvolutionsInfoUseCase
  
  init(
    pokemonInfoRepository: PokemonInfoRepository,
    getEvolutionsInfoUseCase: GetEvolutionsInfoUseCase,
    pokemonInfo: PokemonInfo, pokemonId : Int) {
      
      self.pokemonInfoRepository = pokemonInfoRepository
      self.getEvolutionsInfoUseCase = getEvolutionsInfoUseCase
      
      let pokemonInfo = pokemonInfoRepository.getById(pokemonId)
      let evolutionsInfo = getEvolutionsInfoUseCase.execute(pokemonId: pokemonId)
      
      
      pokemonDetailInfo = PokemonDetailInfo(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        weight: pokemonInfo.weight,
        height: pokemonInfo.height,
        category: pokemonInfo.category,
        abilities: pokemonInfo.abilities,
        description: pokemonInfo.description,
        detailImageInfo: pokemonInfo.detailImageInfo,
        types: pokemonInfo.types,
        genderRatio: pokemonInfo.genderRatio,
        weaknesses: pokemonInfo.weaknesses,
        evolutionsData: evolutionsInfo)
    }
  
}
