//
//  AppData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI
import Observation

class PokemonDataRepository {
  
  private let data : [PokemonData]
  
  init() {
    self.data = [
      PokemonData(
        id: 1,
        name: "Bulbasaur",
        weight: 6.9,
        height: 0.7,
        category: "Seed",
        abilities: ["Overgrow"],
        description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
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
        ],
        region: .kanto
      ),
      PokemonData(
        id: 2,
        name: "Ivysaur",
        weight: 13.0,
        height: 1.0,
        category: "Seed",
        abilities: ["Overgrow"],
        description: "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.",
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
        ],
        region: .kanto
      ),
      PokemonData(
        id: 3,
        name: "Venusaur",
        weight: 100.0,
        height: 2.0,
        category: "Seed",
        abilities: ["Overgrow"],
        description: "Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.",
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
        ],
        region: .kanto
      ),
      PokemonData(
        id: 4,
        name: "Charmander",
        weight: 8.5,
        height: 0.6,
        category: "Lizard",
        abilities: ["Blaze"],
        description: "Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.",
        types: [
          .fire
        ],
        genderRatio: 0.87, 
        weaknesses: [
          .water,
          .ground,
          .rock
        ],
        region: .kanto
      ),
      PokemonData(
        id: 5,
        name: "Charmeleon",
        weight: 19.0,
        height: 1.1,
        category: "Flame",
        abilities: ["Blaze"],
        description: "When it swings its burning tail, it elevates the temperature to unbearably high levels.",
        types: [
          .fire
        ],
        genderRatio: 0.87,
        region: .kanto
      ),
      PokemonData(
        id: 6,
        name: "Charizard",
        weight: 90.5,
        height: 1.7,
        category: "Flame",
        abilities: ["Blaze"],
        description: "Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.",
        types: [
          .fire,
          .flying
        ],
        genderRatio: 0.87,
        weaknesses: [
          .water,
          .electric,
          .rock
        ],
        region: .kanto

      ),
      PokemonData(
        id: 7,
        name: "Squirtle",
        weight: 9.0,
        height: 0.5,
        category: "Tiny Turtle",
        abilities: ["Torrent"],
        description: "After birth, its back swells and hardens into a shell. It sprays a potent foam from its mouth.",
        types: [
          .water
        ],
        genderRatio: 0.87,
        weaknesses: [
          .electric,
          .grass
        ],
        region: .kanto
      ),
      PokemonData(
        id: 8,
        name: "Wartortle",
        weight: 1,
        height: 22.5,
        category: "Turtle",
        abilities: ["Torrent"],
        description: "Wartortle’s long, furry tail is a symbol of longevity, so this Pokémon is quite popular among older people.",
        types: [
          .water
        ],
        genderRatio: 0.87,
        weaknesses: [
          .electric,
          .grass
        ],
        region: .kanto

      ),
      PokemonData(
        id: 9,
        name: "Blastoise",
        weight: 85.5,
        height: 1.6,
        category: "Shellfish",
        abilities: ["Torrent"],
        description: "It deliberately increases its body weight so it can withstand the recoil of the water jets it fires.",
        types: [
          .water
        ],
        genderRatio: 0.87,
        weaknesses: [
          .electric,
          .grass
        ],
        region: .kanto

      ),
      PokemonData(
        id: 13,
        name: "Weedie",
        types: [
          .bug,
          .poison
        ],
        region: .kanto

      ),
      PokemonData(
        id: 14,
        name: "Kakuna",
        types: [
          .bug,
          .poison
        ],
        region: .kanto

      ),
      PokemonData(
        id: 15,
        name: "Beedrill",
        weight: 29.5,
        height: 1.0,
        category: "Poison Bee",
        abilities: ["Swarm"],
        description: "It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.",
        types: [
          .bug,
          .poison
        ],
        genderRatio: 0.5,
        weaknesses: [
          .fire,
          .flying,
          .psychic,
          .rock
        ],
        region: .kanto

      ),
      PokemonData(
        id: 25,
        name: "Pikachu",
        weight: 6.9,
        height: 0.4,
        category: "Mouze",
        abilities: ["Static"],
        description: "It raises its tail to check its surroundings. The tail is sometimes struck by lightning in this pose.",
        types: [
          .electric
        ],
        genderRatio: 0.5,
        weaknesses: [
          .ground
        ],
        region: .kanto

      ),
      PokemonData(
        id: 172,
        name: "Pichu",
        types: [
          .electric
        ],
        region: .johto

      ),
      PokemonData(
        id: 26,
        name: "Raichu",
        types: [
          .electric
        ],
        region: .kanto
      ),
      PokemonData(
        id: 173,
        name: "Cleffa",
        types: [
          .fairy
        ],
        region: .johto

      ),
      PokemonData(
        id: 35,
        name: "Clefairy",
        weight: 7.5,
        height: 0.6,
        category: "Fairy",
        abilities: ["Cute", "Charm", "Magic", "Gaurd"],
        description: "On nights with a full moon, Clefairy gather from all over and dance. Bathing in moonlight makes them float.",
        types: [
          .fairy
        ],
        genderRatio: 0.25,
        weaknesses: [
          .steel,
          .poison
        ],
        region: .kanto

      ),
      PokemonData(
        id: 36,
        name: "Clefable",
        types: [
          .fairy
        ],
        region: .kanto

      ),
      PokemonData(
        id: 50,
        name: "Diglett",
        types: [
          .ground
        ],
        region: .kanto

      ),
      PokemonData(
        id: 51,
        name: "Dugtrio",
        weight: 33.3,
        height: 0.7,
        category: "Mole",
        abilities: ["Sand Veil", "Arena Trap"],
        description: "Its three heads bob separately up and down to loosen the soil nearby, making it easier for it to burrow.",
        types: [
          .ground
        ],
        genderRatio: 0.5,
        weaknesses: [
          .grass,
          .ice,
          .water
        ],
        region: .kanto

      ),
      PokemonData(
        id: 95,
        name: "Onix",
        weight: 210.0,
        height: 8.8,
        category: "Seed",
        abilities: ["Rock Head", "Sturdy"],
        description: "As it digs through the ground, it absorbs many hard objects. This is what makes its body so solid.",
        types: [
          .rock,
          .ground
        ],
        genderRatio: 0.5,
        weaknesses: [
          .fighting,
          .grass,
          .ground,
          .ice,
          .steel,
          .water
        ],
        region: .kanto

      ),
      PokemonData(
        id: 208,
        name: "Steelix",
        types: [
          .rock,
          .steel
        ],
        region: .johto

      ),
      PokemonData(
        id: 108,
        name: "Lickitung",
        weight: 65.5,
        height: 1.2,
        category: "Licking",
        abilities: ["Oblivious", "Own Tempo"],
        description: "If this Pokémon’s sticky saliva gets on you and you don’t clean it off, an intense itch will set in. The itch won’t go away, either.",
        types: [
          .normal
        ],
        genderRatio: 0.5,
        weaknesses: [
          .fighting
        ],
        region: .kanto

      ),
      PokemonData(
        id: 463,
        name: "Lickilicky",
        types: [
          .normal
        ]
      ),
      PokemonData(
        id: 109,
        name: "Koffing",
        weight: 1.0,
        height: 0.6,
        category: "Poison Gas",
        abilities: ["Levitate", "Neutralizing Gas"],
        description: "Toxic gas is held within its thin, balloon-shaped body, so it can cause massive explosions.",
        types: [
          .poison
        ],
        genderRatio: 0.5,
        weaknesses: [
          .ground,
          .psychic
        ],
        region: .kanto
      ),
      PokemonData(
        id: 110,
        name: "Weezing",
        types: [
          .poison
        ]
      ),
      PokemonData(
        id: 151,
        name: "Mew",
        weight: 4.0,
        height: 0.4,
        category: "New Species",
        abilities: ["Synchronize"],
        description: "When viewed through a microscope, this Pokémon’s short, fine, delicate hair can be seen.",
        types: [
          .psychic
        ],
        weaknesses: [
          .bug,
          .dark,
          .ghost
        ],
        region: .kanto
      ),
      PokemonData(
        id: 245,
        name: "Suicune",
        weight: 187.0,
        height: 2.0,
        category: "Aurora",
        abilities: ["Pressure"],
        description: "Suicune embodies the compassion of a pure spring of water. It runs across the land with gracefulness. This Pokémon has the power to purify dirty water.",
        types: [
          .water
        ],
        weaknesses: [
          .electric,
          .grass
        ],
        region: .johto
      ),
      PokemonData(
        id: 304,
        name: "Aron",
        types: [
          .steel,
          .ground
        ]
      ),
      PokemonData(
        id: 305,
        name: "Lairon",
        types: [
          .steel,
          .ground
        ]
      ),
      PokemonData(
        id: 306,
        name: "Aggron",
        weight: 360.0,
        height: 2.1,
        category: "Iron Armor",
        abilities: ["Rock Head","Sturdy"],
        description: "Aggron claims an entire mountain as its own territory. It mercilessly beats up anything that violates its environment. This Pokémon vigilantly patrols its territory at all times.",
        types: [
          .steel,
          .ground
        ],
        genderRatio: 0.5,
        weaknesses: [
          .fighting,
          .fire,
          .ground
        ],
        region: .hoenn
      ),
      PokemonData(
        id: 384,
        name: "Rayquaza",
        weight: 206.5,
        height: 7.0,
        category: "Sky High",
        abilities: ["Air Lock"],
        description: "Rayquaza is said to have lived for hundreds of millions of years. Legends remain of how it put to rest the clash between Kyogre and Groudon.",
        types: [
          .dragon,
        ],
        weaknesses: [
          .dragon,
          .fairy,
          .ice
        ],
        region: .hoenn

      ),
      PokemonData(
        id: 447,
        name: "Riolu",
        types: [
          .fighting,
          .steel
        ]
      ),
      PokemonData(
        id: 448,
        name: "Lucario",
        weight: 54.0,
        height: 1.2,
        category: "Aura",
        abilities: ["Inner Focus", "Steadfast"],
        description: "It’s said that no foe can remain invisible to Lucario, since it can detect auras—even those of foes it could not otherwise see.",
        types: [
          .fighting,
          .steel
        ],
        genderRatio: 0.87,
        weaknesses: [
          .fighting,
          .fire,
          .ground
        ],
        region: .sinnoh
      ),
      PokemonData(
        id: 495,
        name: "Riolu",
        types: [
          .grass
        ]
      ),
      PokemonData(
        id: 496,
        name: "Servine",
        types: [
          .grass
        ]
      ),
      PokemonData(
        id: 497,
        name: "Serperior",
        weight: 60.3,
        height: 3.3,
        category: "Regal",
        abilities: ["Overgrow"],
        description: "It generates energy from sunlight, then amplifies that energy dozens of times within its long body.",
        types: [
          .grass
        ],
        genderRatio: 0.87,
        weaknesses: [
          .bug,
          .fire,
          .flying,
          .ice,
          .poison
        ],
        region: .unova
      ),
      PokemonData(
        id: 570,
        name: "Zoroa",
        types: [
          .dark
        ]
      ),
      PokemonData(
        id: 571,
        name: "Zoroark",
        weight: 81.1,
        height: 1.6,
        category: "Illusion Fox",
        abilities: ["Illusion"],
        description: "Stories say those who tried to catch Zoroark were trapped in an illusion and punished.",
        types: [
          .dark
        ],
        genderRatio: 0.87,
        weaknesses: [
          .bug,
          .fairy,
          .fighting
        ],
        region: .unova
      ),
      PokemonData(
        id: 607,
        name: "Litwick",
        types: [
          .ghost,
          .fire
        ]
      ),
      PokemonData(
        id: 608,
        name: "Lampent",
        types: [
          .ghost,
          .fire
        ]
      ),
      PokemonData(
        id: 609,
        name: "Chandelure",
        weight: 34.3,
        height: 1.0,
        category: "Luring",
        abilities: ["Falsh Fire", "Frame Body"],
        description: "The spirits burned up in its ominous flame lose their way and wander this world forever.",
        types: [
          .ghost,
          .fire
        ],
        genderRatio: 0.5,
        weaknesses: [
          .dark,
          .ghost,
          .ground,
          .rock,
          .water
        ],
        region: .unova
      ),
      PokemonData(
        id: 613,
        name: "Cubchoo",
        weight: 8.5,
        height: 0.5,
        category: "Chill",
        abilities: ["Snow Cloak", "Slush Rush"],
        description: "Many of this species can be found along the shorelines of cold regions. If a Cubchoo lacks dangling snot, there’s a chance it is sick.",
        types: [
          .ice
        ],
        genderRatio: 0.5,
        weaknesses: [
          .fighting,
          .fire,
          .rock,
          .steel
        ],
        region: .unova
      ),
      PokemonData(
        id: 614,
        name: "Beartic",
        types: [
          .ice
        ]
      ),
      PokemonData(
        id: 731,
        name: "Pipipek",
        types: [
          .flying,
          .normal
        ]
      ),
      PokemonData(
        id: 732,
        name: "Trumbeak",
        types: [
          .flying,
          .normal
        ]
      ),
      PokemonData(
        id: 733,
        name: "Toucannon",
        weight: 26.0,
        height: 1.1,
        category: "Cannon",
        abilities: ["Keen Eye", "Skill Link"],
        description: "The compressed gas in Toucannon’s beak launches seeds with such force that they can shatter large boulders.",
        types: [
          .flying,
          .normal
        ],
        genderRatio: 0.5,
        weaknesses: [
          .electric,
          .ice,
          .rock
        ],
        region: .alola
      ),
    ]
  }
  
  func list() -> [PokemonData] {
    return data
  }
  
  func getById(_ id: Int) -> PokemonData {
    return data.first { $0.id == id }!
  }
  
  func listByType(_ type: PokemonTypeInfo) -> [PokemonData] {
    return data.filter { $0.types.contains(type) }
  }
}
