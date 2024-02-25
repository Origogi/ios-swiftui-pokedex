//
//  ElementTypeCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI

struct ElementTypeCard: View {
  let type : ElementTypeInfo
  
  init(type: ElementTypeInfo) {
    self.type = type
  }
  
  var body: some View {
    ZStack {
      Image(type.smallImagePath)
        .resizable()
        .renderingMode(.template)
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(colors: [.white, .white.opacity(0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .scaledToFit()
        .padding(.vertical, 4)
      
      
    }.frame(maxWidth: 126, maxHeight: 100)
      .background(type.primaryColor)
      .cornerRadius(15)
    
  }
  
  
}

#Preview {
  ElementTypeCard(
    type: .fire
  )
}
