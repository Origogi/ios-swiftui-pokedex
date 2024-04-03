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
        ForEach(evolutionsInfo.chains, id: \.self) { chain in
          VStack {
            if let condition = chain.condition {
              EvolutionConditionView(condition: condition)
            }
            PokemonSamllCard(pokemon: chain.next)
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
          next: PokemonInfoRepository().getAll()[0]
        ),
        EvolutionChain(
          condition: "Level 16",
          next: PokemonInfoRepository().getAll()[1]
        ),
        EvolutionChain(
          condition: "Level 32",
          next: PokemonInfoRepository().getAll()[2]
        ),
      ]
    )
  )
}
