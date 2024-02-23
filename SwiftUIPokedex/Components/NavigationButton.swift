//
//  NavigationButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/22/24.
//

import SwiftUI

struct NavigationButton: View {
  let foregroundColor: Color
  let onImagePath : String
  let offImagePath : String
  let title : String
  let isActivated: Bool
  
  init(
    foregroundColor: Color,
    onImagePath: String,
    offImagePath: String,
    isActivated: Bool,
    title: String
  ) {
    self.foregroundColor = foregroundColor
    self.onImagePath = onImagePath
    self.offImagePath = offImagePath
    self.title = title
    self.isActivated = isActivated
  }
  
  var body: some View {
    ZStack(alignment: .top) {
      Rectangle()
        .fill(foregroundColor)
        .frame(width: 56,height: 56)
      Image(isActivated ? onImagePath : offImagePath)
        .resizable()
        .frame(width: 26, height: 26)
        .offset(y : isActivated ? 7 : 15)
      Text(title)
        .font(.custom("Poppins-Medium", size: 12))
        .foregroundColor(Color(hex: "173EA5"))
        .offset(y : 31)
        .opacity(isActivated ? 1 : 0)
    }
  }
}

#Preview {
  NavigationButton(
  
    foregroundColor: Color.white, onImagePath: "PokedexOn", offImagePath: "PokedexOff", isActivated: true, title: "Pokedex"
  )
}

#Preview {
  NavigationButton(
    foregroundColor: Color.white, onImagePath: "RegionOn", offImagePath: "RegionOff", isActivated: false, title: "Region"
  )
}
