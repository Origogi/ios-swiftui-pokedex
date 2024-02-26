//
//  ElementTypeChip.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct ElementTypeChip: View {
  let type : ElementTypeInfo
  
  init(type: ElementTypeInfo) {
    self.type = type
  }
  
  var body: some View {
    HStack(spacing: 6) {
      ZStack {
        Circle()
          .frame(width: 20, height: 20)
          .foregroundColor(Color.white)
        Image(type.smallImagePath)
          .resizable()
          .renderingMode(.template)
          .scaledToFit()
          .frame(width: 12, height: 12)
          .foregroundColor(type.primaryColor)
      }
      Text(type.name)
        .font(.custom("Poppins-Medium", size: 11))
        .foregroundColor(type.textColorOnPrimaryColorBg)
    }
    .padding(.leading, 6)
    .padding(.trailing, 8)
    .padding(.vertical, 3)
    .background(type.primaryColor)
    .cornerRadius(48)
  }
}

#Preview {
  VStack {
    ForEach(ElementTypeInfo.allCases, id: \.self) { type in
      ElementTypeChip(type: type)
    }
  }

}
