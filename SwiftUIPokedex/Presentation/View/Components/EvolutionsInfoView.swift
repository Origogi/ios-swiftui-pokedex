//
//  EvolutionsInfoView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/18/24.
//

import SwiftUI

struct EvolutionsInfoView: View {
  
  let evolutionChain : EvolutionChain?
  
  var body: some View {
    
    
    
    VStack(alignment: .leading, spacing: 8) {
      Text("Evolutions")
        .customTextStyle(font: .caption2, color: .black)
      
      let array = chainToArray(evolutionChain)
      
      let first = array.first!
      let remain = array.dropFirst()
      
      VStack(alignment: .leading, spacing :0) {
        if array.count == 1 {
          Text("This Pokémon does not evolve")
            .customTextStyle(font: .caption2, color: gray700)
            .padding(.bottom, 16)
        }
        
        PokemonSamllCard(info: first.cardInfo)
        ForEach(remain, id: \.id) { item in

          VStack(spacing : 0) {
            EvolutionConditionView(condition: "")

            PokemonSamllCard(info: item.cardInfo)
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
  
  // 연결 리스트를 배열로 변환하는 도우미 함수
  private func chainToArray(_ node: EvolutionChain?) -> [EvolutionChain] {
    var array = [EvolutionChain]()
    var currentNode = node
    while let current = currentNode {
      
      if current.cardInfo.name == "" {
        break
      }
      
      array.append(current)
      currentNode = current.next
    }
    return array
  }

  
}



struct EvolutionConditionView: View {
  let condition : String
  
  var body: some View {
    HStack(spacing :8) {
      Image("ArrowDown")
      Text(condition)
        .customTextStyle(font: .caption2, color : Color(hex: "#173EA5"))
    }.padding(8)
  }
}



#Preview {
  EvolutionsInfoView(
    evolutionChain: EvolutionChain(
      cardInfo: PokemonCardInfo(
        id: 1,
        name: "Bulbasaur",
        imagePath: "Bulbasaur", types: [.poison]
      ),
      next: EvolutionChain(
        cardInfo: PokemonCardInfo(
          id: 2,
          name: "Ivysaur",
          imagePath: "Ivysaur", types: [.poison]
        ),
        next: EvolutionChain(
          cardInfo: PokemonCardInfo(
            id: 3,
            name: "Venusaur",
            imagePath: "Venusaur", 
            types: [.poison]
          )
        )
      )
    )
    
  )
}
