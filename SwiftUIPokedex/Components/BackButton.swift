//
//  CustomBackButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/10/24.
//

import SwiftUI

struct BackButton: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    Button (action: {
      dismiss()
    }, label: {
      Image("ArrowLeft")
        .resizable()
      
    })
    .frame(width: 38, height: 38)
  }
}

#Preview {
  BackButton()
    .background(.red)
}
