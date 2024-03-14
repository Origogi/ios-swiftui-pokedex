//
//  ElementTypeChip.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct ElementTypeChip: View {
  let type : ElementTypeInfo
  let horizontalPadding : CGFloat
  let verticalPadding : CGFloat
  let fontSize : CGFloat
  let iconSize : CGFloat
  

  var body: some View {
    HStack {
      Spacer()
        .frame(width: horizontalPadding)
      ZStack {
        Circle()
          .foregroundColor(Color.white)
        Image(type.smallImagePath)
          .resizable()
          .renderingMode(.template)
          .scaledToFit()
          .padding(4)
          .foregroundColor(type.primaryColor)
      }.frame(width: iconSize, height: iconSize)

      Text(type.name)
        .font(.custom("Poppins-Medium", size: fontSize))
        .foregroundColor(type.textColorOnPrimaryColorBg)
      Spacer()
        .frame(width: horizontalPadding)

    }
    .padding(.vertical, verticalPadding)
    .background(type.primaryColor)
    .cornerRadius(48)
  }
}


#Preview {
  VStack {
    ForEach(ElementTypeInfo.allCases, id: \.self) { type in
      ElementTypeChip(type: type, horizontalPadding: .infinity, verticalPadding: 3, fontSize: 12, iconSize: 20)
    }
  }

}
