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
          PokemonSamllCard(pokemon: chain.next)
        }
      }
    }
  }
}



#Preview {
  EvolutionsInfoView(
    evolutionsInfo: EvolutionsInfo(
      chains: [
        EvolutionChain(
          next: AppData().pokemons[0]
        ),
        EvolutionChain(
          condition: "Level 16",
          next: AppData().pokemons[1]
        ),
        EvolutionChain(
          condition: "Level 32",
          next: AppData().pokemons[2]
        ),
      ]
    )
  )
}
