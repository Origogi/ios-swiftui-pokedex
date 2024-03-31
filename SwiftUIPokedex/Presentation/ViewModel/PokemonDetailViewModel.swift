//
//  PokemonDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class PokemonDetailViewModel : ObservableObject {
  
  @Published var pokemonDetailInfo : PokemonDetailInfo?
  
  private let getPokemonInfoUseCase : GetPokemonInfoUseCase
  private let getEvolutionsInfoUseCase : GetEvolutionsInfoUseCase
  private let pokemonId : Int
  
  init(
    getPokemonInfoUseCase: GetPokemonInfoUseCase,
    getEvolutionsInfoUseCase: GetEvolutionsInfoUseCase,
    pokemonId : Int) {
      
      self.getPokemonInfoUseCase = getPokemonInfoUseCase
      self.getEvolutionsInfoUseCase = getEvolutionsInfoUseCase
      self.pokemonId = pokemonId
    }
  
  func load() {
    let pokemonInfo = getPokemonInfoUseCase.execute(id: pokemonId)
    let evolutionsInfo = getEvolutionsInfoUseCase.execute(id: pokemonId)
    
    
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
