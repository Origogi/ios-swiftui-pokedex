//
//  NavigationButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/22/24.
//

import SwiftUI

struct TabViewBottomButton: View {
  let foregroundColor: Color
  let onImagePath : String
  let offImagePath : String
  let title : String
  @Binding var isActivated: Bool
  
  var body: some View {
    ZStack(alignment: .top) {
      Rectangle()
        .fill(foregroundColor)
        .frame(width: 56, height: 56)
      Image(isActivated ? onImagePath : offImagePath)
        .resizable()
        .frame(width: isActivated ? 26 : 20, height: isActivated ? 26 : 20) // 사이즈 변경에도 애니메이션 적용
        .offset(y: isActivated ? 7 : 15)
        .animation(.easeInOut(duration: 0.2), value: isActivated) // isActivated 값 변경에 따라 애니메이션 적용
      Text(title)
        .font(.custom("Poppins-Medium", size: 12))
        .foregroundColor(Color(hex: "173EA5"))
        .offset(y: 31)
        .opacity(isActivated ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: isActivated) // 텍스트 투명도 변경에 애니메이션 적용
    }
  }
}

#Preview {
  TabViewBottomButton(
  
    foregroundColor: Color.white, onImagePath: "PokedexOn", offImagePath: "PokedexOff", title: "Pokedex", isActivated: .constant(true)
  )
}

#Preview {
  TabViewBottomButton(
    foregroundColor: Color.white, onImagePath: "RegionOn", offImagePath: "RegionOff", title: "Region", isActivated: .constant(false)
  )
}
