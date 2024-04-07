//
//  ElementTypeChip.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct ElementTypeSmallChip : View {
  let type : ElementTypeInfo
  
  var body: some View {
    HStack {
      Image(type.smallImagePath)
        .resizable()
        .renderingMode(.template)
        .scaledToFit()
        .padding(2)
        .foregroundColor(.white)
    }
    .frame(maxWidth: .infinity)
    .background(type.primaryColor)
    .cornerRadius(48)
  }
}

struct ElementTypeChip: View {
  let type : ElementTypeInfo
  let fontSize : CGFloat
  let iconSize : CGFloat
  let innerHPadding : CGFloat?
  let innerVPadding : CGFloat?
  
  init(type: ElementTypeInfo, fontSize: CGFloat, iconSize: CGFloat, innerHPadding: CGFloat? = nil, innerVPadding: CGFloat? = nil) {
    self.type = type
    self.fontSize = fontSize
    self.iconSize = iconSize
    self.innerHPadding = innerHPadding
    self.innerVPadding = innerVPadding
  }
  
  var body: some View {
    HStack(spacing : 8) {
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
        .lineLimit(1)
        .font(.custom("Poppins-Medium", size: fontSize))
        .foregroundColor(type.textColorOnPrimaryColorBg)
    }
    .frame(maxWidth : innerHPadding == nil ? .infinity : nil)
    .padding(.vertical, innerVPadding)
    .padding(.horizontal, innerHPadding)
    .background(type.primaryColor)
    .cornerRadius(48)
  }
}


#Preview {
  VStack {
    ForEach(ElementTypeInfo.allCases, id: \.self) { type in
      ElementTypeSmallChip(type: type)
        .frame(width: 68, height: 14)
    }
  }
  
}