//
//  StatusGroupView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/5/24.
//

import SwiftUI

struct StatusGroupView: View {
  let weight: Double
  let height: Double
  let category: String
  let abilities: [String]
  
  var body: some View {
    VStack(spacing: 20) {
      HStack(spacing : 20) {
        StatusView(
          statusName: "Weight", 
          value: "\(weight) kg",
          iconPath: "Weight"
        )
        
        StatusView(
          statusName: "Height",
          value: "\(height) m",
          iconPath: "Height"
        )
      }
      
      HStack(alignment: .top, spacing : 20) {
        StatusView(
          statusName: "Category",
          value: category,
          iconPath: "Category"
        )
        
        StatusView(
          statusName: "Abilities",
          value: abilities.joined(separator: " "),
          iconPath: "Abilities"
        )
      }
    }
  }
}

#Preview {
  StatusGroupView(
    weight: 12.5,
    height: 0.6,
    category: "Seed",
    abilities: ["Overgrow", "Chlorophyll"]
  )
}
