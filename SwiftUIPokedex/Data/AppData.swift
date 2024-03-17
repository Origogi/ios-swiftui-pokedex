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
        abilities: ["Overgrow"],
        description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 1,
          width : 150,
          height: 150
        ),
        types: [
          .grass,
          .poison,
        ],
        genderRatio: 0.87,
        weaknesses: [
          .fire,
          .ice,
          .flying,
          .psychic
        ]
      ),
      PokemonInfo(
        id: 2,
        name: "Ivysaur",
        weight: 13.0,
        height: 1.0,
        category: "Seed",
        abilities: ["Overgrow"],
        description: "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 2,
          width : 250,
          height: 200
        ),
        types: [
          .grass,
          .poison,
        ],
        genderRatio: 0.85,
        weaknesses: [
          .fire,
          .ice,
          .flying,
          .psychic
        ]
      ),
      PokemonInfo(
        id: 3,
        name: "Venusaur",
        weight: 100.0,
        height: 2.0,
        category: "Seed",
        abilities: ["Overgrow"],
        description: "Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 3,
          width : 270,
          height: 200
        ),
        types: [
          .grass,
          .poison,
        ],
        genderRatio: 0.87,
        weaknesses: [
          .fire,
          .ice,
          .flying,
          .psychic
        ]
      ),
      PokemonInfo(
        id: 4,
        name: "Charmander",
        weight: 8.5,
        height: 0.6,
        category: "Lizard",
        abilities: ["Blaze"],
        description: "Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 4,
          width : 130,
          height: 155
        ),
        types: [
          .fire
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 5,
        name: "Charmeleon",
        weight: 19.0,
        height: 1.1,
        category: "Flame",
        abilities: ["Blaze"],
        description: "When it swings its burning tail, it elevates the temperature to unbearably high levels.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 5,
          width : 170,
          height: 200
        ),
        types: [
          .fire
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 6,
        name: "Charizard",
        weight: 90.5,
        height: 1.7,
        category: "Flame",
        abilities: ["Blaze"],
        description: "Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 6,
          width : 280,
          height: 300
        ),
        types: [
          .fire,
          .flying
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 7,
        name: "Squirtle",
        weight: 6.9,
        height: 0.7,
        category: "Tiny Turtle",
        abilities: ["Torrent"],
        description: "After birth, its back swells and hardens into a shell. It sprays a potent foam from its mouth.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 7,
          width : 150,
          height: 150
        ),
        types: [
          .water
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 8,
        name: "Wartortle",
        weight: 6.9,
        height: 0.7,
        category: "Turtle",
        abilities: ["Torrent"],
        description: "Wartortle’s long, furry tail is a symbol of longevity, so this Pokémon is quite popular among older people.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 8,
          width : 150,
          height: 200
        ),
        types: [
          .water
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 9,
        name: "Blastoise",
        weight: 6.9,
        height: 0.7,
        category: "Shellfis",
        abilities: ["Torrent"],
        description: "It deliberately increases its body weight so it can withstand the recoil of the water jets it fires.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 9,
          width : 230,
          height: 230
        ),
        types: [
          .water
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 15,
        name: "Beedrill",
        weight: 6.9,
        height: 0.7,
        category: "Poison Bee",
        abilities: ["Swarm"],
        description: "It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.",
        detailImageInfo: PokemonDetailImageInfo(
          id : 15,
          width : 220,
          height: 250
        ),
        types: [
          .bug,
          .poison
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 25,
        name: "Pikachu",
        weight: 6.9,
        height: 0.7,
        category: "Mouze",
        abilities: ["Static"],
        description: "It raises its tail to check its surroundings. The tail is sometimes struck by lightning in this pose.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 25,
          width : 220,
          height: 170
        ),
        types: [
          .electric
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 35,
        name: "Clefairy",
        weight: 6.9,
        height: 0.7,
        category: "Fairy",
        abilities: ["Cute", "Charm", "Magic", "Gaurd"],
        description: "On nights with a full moon, Clefairy gather from all over and dance. Bathing in moonlight makes them float.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 35,
          width : 210,
          height: 180
        ),
        types: [
          .fairy
        ],
        genderRatio: 0.25
      ),
      PokemonInfo(
        id: 51,
        name: "Dugtrio",
        weight: 6.9,
        height: 0.7,
        category: "Mole",
        abilities: ["Sand Veil", "Arena Trap"],
        description: "Its three heads bob separately up and down to loosen the soil nearby, making it easier for it to burrow.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 51,
          width : 185,
          height: 140
        ),
        types: [
          .ground
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 95,
        name: "Onix",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: ["Rock Head", "Sturdy"],
        description: "As it digs through the ground, it absorbs many hard objects. This is what makes its body so solid.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 95,
          width : 220,
          height: 280
        ),
        types: [
          .rock,
          .ground
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 108,
        name: "Lickitung",
        weight: 6.9,
        height: 0.7,
        category: "Licking",
        abilities: ["Oblivious", "Own Tempo"],
        description: "If this Pokémon’s sticky saliva gets on you and you don’t clean it off, an intense itch will set in. The itch won’t go away, either.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 108,
          width : 180,
          height: 180
        ),
        types: [
          .normal
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 109,
        name: "Koffing",
        weight: 6.9,
        height: 0.7,
        category: "Poison Gas",
        abilities: ["Levitate", "Neutralizing Gas"],
        description: "Toxic gas is held within its thin, balloon-shaped body, so it can cause massive explosions.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 109,
          width : 230,
          height: 230
        ),
        types: [
          .poison
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 151,
        name: "Mew",
        weight: 6.9,
        height: 0.7,
        category: "New Species",
        abilities: ["Synchronize"],
        description: "When viewed through a microscope, this Pokémon’s short, fine, delicate hair can be seen.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 151,
          width : 140,
          height: 180
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
        category: "Aurora",
        abilities: ["Pressure"],
        description: "Suicune embodies the compassion of a pure spring of water. It runs across the land with gracefulness. This Pokémon has the power to purify dirty water.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 245,
          width : 300,
          height: 240
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
        category: "Iron Armor",
        abilities: ["Rock Head","Sturdy"],
        description: "Aggron claims an entire mountain as its own territory. It mercilessly beats up anything that violates its environment. This Pokémon vigilantly patrols its territory at all times.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 306,
          width : 240,
          height: 220
        ),
        types: [
          .steel,
          .ground
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 384,
        name: "Rayquaza",
        weight: 6.9,
        height: 0.7,
        category: "Sky High",
        abilities: ["Air Lock"],
        description: "Rayquaza is said to have lived for hundreds of millions of years. Legends remain of how it put to rest the clash between Kyogre and Groudon.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 384,
          width : 240,
          height: 260
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
        category: "Aura",
        abilities: ["Inner Focus", "Steadfast"],
        description: "It’s said that no foe can remain invisible to Lucario, since it can detect auras—even those of foes it could not otherwise see.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 448,
          width : 125,
          height: 230
        ),
        types: [
          .fighting,
          .steel
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 497,
        name: "Serperior",
        weight: 6.9,
        height: 0.7,
        category: "Regal",
        abilities: ["Overgrow"],
        description: "It generates energy from sunlight, then amplifies that energy dozens of times within its long body.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 497,
          width : 220,
          height: 260
        ),
        types: [
          .grass
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 571,
        name: "Zoroark",
        weight: 6.9,
        height: 0.7,
        category: "Illusion Fox",
        abilities: ["Illusion"],
        description: "Stories say those who tried to catch Zoroark were trapped in an illusion and punished.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 571,
          width : 220,
          height: 215
        ),
        types: [
          .dark
        ],
        genderRatio: 0.87
      ),
      PokemonInfo(
        id: 609,
        name: "Chandelure",
        weight: 6.9,
        height: 0.7,
        category: "Luring",
        abilities: ["Falsh Fire", "Frame Body"],
        description: "The spirits burned up in its ominous flame lose their way and wander this world forever.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 609,
          width : 220,
          height: 200
        ),
        types: [
          .ghost,
          .fire
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 613,
        name: "Cubchoo",
        weight: 6.9,
        height: 0.7,
        category: "Chill",
        abilities: ["Snow Cloak", "Slush Rush"],
        description: "Many of this species can be found along the shorelines of cold regions. If a Cubchoo lacks dangling snot, there’s a chance it is sick.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 613,
          width : 130,
          height: 150
        ),
        types: [
          .ice
        ],
        genderRatio: 0.5
      ),
      PokemonInfo(
        id: 733,
        name: "Toucannon",
        weight: 6.9,
        height: 0.7,
        category: "Cannon",
        abilities: ["Keen Eye", "Skill Link"],
        description: "The compressed gas in Toucannon’s beak launches seeds with such force that they can shatter large boulders.",
        detailImageInfo: PokemonDetailImageInfo(
          id: 733,
          width : 200,
          height: 170
        ),
        types: [
          .flying,
          .normal
        ],
        genderRatio: 0.5
      ),
    ]
  }
}
