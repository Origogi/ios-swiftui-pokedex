//
//  EvolutionsInfoView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import SwiftUI

struct EvolutionsInfoView: View {
  
  let evolutionsInfo : EvolutionsInfo
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Evolutions")
        .font(.custom("Poppins-Medium", size: 18))
      VStack {
        ForEach(evolutionsInfo.chains) { chain in
          VStack {
            if let condition = chain.condition {
              EvolutionConditionView(condition: condition)
            }
            PokemonSamllCard(info: chain.next)
          }
        }
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 24)
      .overlay(
        RoundedRectangle(cornerRadius: 15) // Rounded rectangle shape
          .stroke(Color(hex: "#E6E6E6"), lineWidth: 1) // Border with blue color and 2 points width
      )
      
    }
  }
}

struct EvolutionConditionView: View {
  let condition : String
  
  var body: some View {
    HStack(spacing :8) {
      Image("ArrowDown")
      Text(condition)
        .font(.custom("Poppins-Medium", size: 14))
    }.foregroundColor(Color(hex: "#173EA5"))
  }
}



#Preview {
  EvolutionsInfoView(
    evolutionsInfo: EvolutionsInfo(
      chains: [
        EvolutionChain(
          next: PokemonCardInfo(pokedexId: 1, name: "name1", imagePath: "1_medium", types: [.bug])
        ),
        EvolutionChain(
          condition: "Level 16",
          next: PokemonCardInfo(pokedexId: 2, name: "name2", imagePath: "1_medium", types: [.bug])
        ),
        EvolutionChain(
          condition: "Level 32",
          next: PokemonCardInfo(pokedexId: 3, name: "name3", imagePath: "1_medium", types: [.bug])
        ),
      ]
    )
  )
}
