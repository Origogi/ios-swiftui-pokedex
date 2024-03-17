//
//  ElementTypeCard.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/25/24.
//

import SwiftUI

enum SizeType {
  case small
  case medium
}

private struct _ElementTypeCard: View {
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
    }
  }
}

struct ElementTypeCardView : View {
  
  let type : ElementTypeInfo
  let size : SizeType
  
  
  var body : some View {
    switch size {
    case .small:
      _ElementTypeCard(type: type)
        .frame(width: 64, height: 64)
        .background(type.primaryColor)
        .cornerRadius(15)
    case .medium:
      _ElementTypeCard(type: type)
        .frame(width: 126, height: 100)
        .background(type.primaryColor)
        .cornerRadius(15)
    }
  }
}

#Preview {
  List {
    ForEach(ElementTypeInfo.allCases, id: \.self) { type in
      ElementTypeCardView(type: type, size: .medium)
    }
  }
}
