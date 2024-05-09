//
//  PokemonDetailViewModel.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class PokemonDetailViewModel : ObservableObject {
  
  @Published var pokemonDetailInfo : PokemonDetailInfo?
  
  private let getPokemonInfoUseCase : GetPokemonInfoUseCase = GetPokemonInfoUseCase()
  private let getEvolutionsInfoUseCase : GetEvolutionsInfoUseCase = GetEvolutionsInfoUseCase()
  private let getPokemonCardInfoListUseCase : GetPokemonCardInfoListUseCase = GetPokemonCardInfoListUseCase()
  private let pokeAPIRepository : PokeAPIRepository = PokeAPIRepository()
  private let pokemonId : Int
  
  init(pokemonId: Int) {
    self.pokemonId = pokemonId
  }
  
  
  func load() {
    let pokemonInfo = getPokemonInfoUseCase.execute(id: pokemonId)
    let evolutionsInfo = getEvolutionsInfoUseCase.execute(id: pokemonId)
    
    
    pokemonDetailInfo = PokemonDetailInfo(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      weight: pokemonInfo.weight ?? 0.0,
      height: pokemonInfo.height ?? 0.0,
      category: pokemonInfo.category ?? "",
      abilities: pokemonInfo.abilities,
      description: pokemonInfo.description ?? "",
      types: pokemonInfo.types,
      genderRatio: pokemonInfo.genderRatio,
      weaknesses: pokemonInfo.weaknesses,
      evolutionsData: evolutionsInfo)
  
  }
  
}
