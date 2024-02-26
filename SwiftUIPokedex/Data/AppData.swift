//
//  AppData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI
import Observation

@Observable class AppData {
  
  let pokemons : [PokemonInfo]
  var myFavorites : Set<Int>
  
  init() {
    self.myFavorites = []
    
    self.pokemons = [
      PokemonInfo(
        id: 1,
        name: "Bulbasaur",
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 2,
        name: "Ivysaur",
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 3,
        name: "Venusaur",
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 4,
        name: "Charmander",
        types: [
          .fire
        ]
      ),
      PokemonInfo(
        id: 5,
        name: "Charmeleon",
        types: [
          .fire
        ]
      ),
      PokemonInfo(
        id: 6,
        name: "Charizard",
        types: [
          .fire,
          .flying
        ]
      ),
      PokemonInfo(
        id: 7,
        name: "Squirtle",
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 8,
        name: "Wartortle",
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 9,
        name: "Blastoise",
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 15,
        name: "Beedrill",
        types: [
          .bug,
          .poison
        ]
      ),
      PokemonInfo(
        id: 25,
        name: "Pikachu",
        types: [
          .electric
        ]
      ),
      PokemonInfo(
        id: 35,
        name: "Clefairy",
        types: [
          .fairy
        ]
      ),
      PokemonInfo(
        id: 51,
        name: "Dugtrio",
        types: [
          .ground
        ]
      ),
      PokemonInfo(
        id: 95,
        name: "Onix",
        types: [
          .rock,
          .ground
        ]
      ),
      PokemonInfo(
        id: 108,
        name: "Lickitung",
        types: [
          .normal
        ]
      ),
      PokemonInfo(
        id: 109,
        name: "Koffing",
        types: [
          .poison
        ]
      ),
      PokemonInfo(
        id: 151,
        name: "Mew",
        types: [
          .psychic
        ]
      ),
      PokemonInfo(
        id: 245,
        name: "Suicune",
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 306,
        name: "Aggron",
        types: [
          .steel,
          .ground
        ]
      ),
      PokemonInfo(
        id: 384,
        name: "Rayquaza",
        types: [
          .dragon,
        ]
      ),
      PokemonInfo(
        id: 448,
        name: "Lucario",
        types: [
          .fighting,
          .steel
        ]
      ),
      PokemonInfo(
        id: 497,
        name: "Serperior",
        types: [
          .grass
        ]
      ),
      PokemonInfo(
        id: 571,
        name: "Zoroark",
        types: [
          .dark
        ]
      ),
      PokemonInfo(
        id: 609,
        name: "Chandelure",
        types: [
          .ghost,
          .fire
        ]
      ),
      PokemonInfo(
        id: 613,
        name: "Cubchoo",
        types: [
          .ice
        ]
      ),
      PokemonInfo(
        id: 733,
        name: "Toucannon",
        types: [
          .flying,
          .normal
        ]
      ),
    ]
  }
}
