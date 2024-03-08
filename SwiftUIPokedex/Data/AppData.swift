//
//  AppData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI
import Observation

class AppData {
  
  let pokemons : [PokemonInfo]
  
  init() {
    
    self.pokemons = [
      PokemonInfo(
        id: 1,
        name: "Bulbasaur",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.", 
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 2,
        name: "Ivysaur",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 2,
          width : 250,
          height: 200
        ),
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 3,
        name: "Venusaur",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 3,
          width : 270,
          height: 200
        ),
        types: [
          .grass,
          .poison,
        ]
      ),
      PokemonInfo(
        id: 4,
        name: "Charmander",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "The flame at the tip of its tail makes a sound as it burns. You can only hear it in quiet places.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 4,
          width : 130,
          height: 155
        ),
        types: [
          .fire
        ]
      ),
      PokemonInfo(
        id: 5,
        name: "Charmeleon",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 5,
          width : 170,
          height: 200
        ),
        types: [
          .fire
        ]
      ),
      PokemonInfo(
        id: 6,
        name: "Charizard",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It spits fire that is hot enough to melt boulders. It may cause forest fires by blowing flames.", 
        detailImageInfo: PokemonDetailImageInfo(
          id : 6,
          width : 280,
          height: 300
        ),
        types: [
          .fire,
          .flying
        ]
      ),
      PokemonInfo(
        id: 7,
        name: "Squirtle",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "When it retracts its long neck into its shell, it squirts out water with vigorous force.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 1,
          width : 150,
          height: 150
        ),
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 8,
        name: "Wartortle",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It is recognized as a symbol of longevity. If its shell has algae on it, that Wartortle is very old.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 1,
          width : 150,
          height: 150
        ),
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 9,
        name: "Blastoise",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "The rocket cannons on its shell fire jets of water capable of punching holes through thick steel.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 1,
          width : 150,
          height: 150
        ),
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 15,
        name: "Beedrill",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 1,
          width : 150,
          height: 150
        ),
        types: [
          .bug,
          .poison
        ]
      ),
      PokemonInfo(
        id: 25,
        name: "Pikachu",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It raises its tail to check its surroundings. The tail is sometimes struck by lightning in this pose.", 
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .electric
        ]
      ),
      PokemonInfo(
        id: 35,
        name: "Clefairy",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .fairy
        ]
      ),
      PokemonInfo(
        id: 51,
        name: "Dugtrio",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "As it digs through the ground, it absorbs many hard objects. This is what makes its body so solid.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .ground
        ]
      ),
      PokemonInfo(
        id: 95,
        name: "Onix",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "As it digs through the ground, it absorbs many hard objects. This is what makes its body so solid.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .rock,
          .ground
        ]
      ),
      PokemonInfo(
        id: 108,
        name: "Lickitung",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.", 
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .normal
        ]
      ),
      PokemonInfo(
        id: 109,
        name: "Koffing",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        
        description: "If Koffing becomes agitated, it raises the toxicity of its internal gases and jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .poison
        ]
      ),
      PokemonInfo(
        id: 151,
        name: "Mew",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "Because it can learn any move, some people began research to see if it is the ancestor of all Pokémon.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .psychic
        ]
      ),
      PokemonInfo(
        id: 245,
        name: "Suicune",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "Said to be the reincarnation of north winds, it can instantly purify filthy, murky water.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .water
        ]
      ),
      PokemonInfo(
        id: 306,
        name: "Aggron",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "Aggron claims an entire mountain as its own territory. It mercilessly beats up anything that violates its environment. This Pokémon vigilantly patrols its territory at all times.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .steel,
          .ground
        ]
      ),
      PokemonInfo(
        id: 384,
        name: "Rayquaza",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "Rayquaza is said to have lived for hundreds of millions of years. Legends remain of how it put to rest the clash between Kyogre and Groudon.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .dragon,
        ]
      ),
      PokemonInfo(
        id: 448,
        name: "Lucario",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "By catching the aura emanating from others, it can read their thoughts and movements.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .fighting,
          .steel
        ]
      ),
      PokemonInfo(
        id: 497,
        name: "Serperior",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It can stop its opponents' movements with just a glare. It takes in solar energy and boosts it internally.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .grass
        ]
      ),
      PokemonInfo(
        id: 571,
        name: "Zoroark",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "It changes so it looks just like its foe, tricks it, and then uses that opportunity to flee.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .dark
        ]
      ),
      PokemonInfo(
        id: 609,
        name: "Chandelure",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "The spirits burned up in its ominous flame lose their way and wander this world forever.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .ghost,
          .fire
        ]
      ),
      PokemonInfo(
        id: 613,
        name: "Cubchoo",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "When this Pokémon is in good health, its snot becomes thicker and stickier. It will smear its snot on anyone it doesn't like.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .ice
        ]
      ),
      PokemonInfo(
        id: 733,
        name: "Toucannon",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: "Overgrow",
        description: "When it battles, its beak heats up. The temperature can easily exceed 212 degrees Fahrenheit, causing severe burns when it hits.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .flying,
          .normal
        ]
      ),
    ]
  }
}
