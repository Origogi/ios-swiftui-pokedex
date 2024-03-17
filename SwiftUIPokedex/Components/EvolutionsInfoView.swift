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
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}


#Preview {
  EvolutionsInfoView(
    evolutionsInfo: EvolutionsInfo(
      origin: AppData().pokemons.first!,
      evolutionChain: [
        EvolutionChain(
          condition: "Level 16",
          evelution: AppData().pokemons[1]
        ),
        EvolutionChain(
          condition: "Level 32",
          evelution: AppData().pokemons[2]
        ),
      ]
    )
  )
}
