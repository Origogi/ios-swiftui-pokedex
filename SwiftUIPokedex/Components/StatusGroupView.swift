//
//  StatusGroupView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/5/24.
//

import SwiftUI

struct StatusGroupView: View {
  let pokemon : PokemonInfo
  
  
  var body: some View {
    VStack(spacing: 20) {
      HStack(spacing : 20) {
        StatusView(
          statusName: "Weight", 
          value: "\(pokemon.weight) kg",
          iconPath: "Weight"
        )
        
        StatusView(
          statusName: "Height",
          value: "\(pokemon.weight) m",
          iconPath: "Height"
        )
      }
      
      HStack(spacing : 20) {
        StatusView(
          statusName: "Category",
          value: pokemon.category,
          iconPath: "Category"
        )
        
        StatusView(
          statusName: "Abilities",
          value: pokemon.abilities,
          iconPath: "Abilities"
        )
      }
    }
  }
}

#Preview {
  StatusGroupView(
    pokemon: AppData().pokemons.first!
  ).padding()
}
