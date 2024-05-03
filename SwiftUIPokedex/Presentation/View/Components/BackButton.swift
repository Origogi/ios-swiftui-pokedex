//
//  CustomBackButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/10/24.
//

import SwiftUI

enum BackButtonType {
  case v1
  case v2
  
  var image: String {
    switch self {
    case .v1:
      return "ArrowLeft"
    case .v2:
      return "ArrowLeft2"
    }
  }
}

struct BackButton: View {
  @Environment(\.dismiss) var dismiss
  
  let type: BackButtonType
  
  var body: some View {
    Button (action: {
      dismiss()
    }, label: {
      Image(type.image)
        .resizable()
      
    })
    .frame(width: 38, height: 38)
  }
}

#Preview {
  BackButton(
    type: .v1
  )
    .background(.red)
}
