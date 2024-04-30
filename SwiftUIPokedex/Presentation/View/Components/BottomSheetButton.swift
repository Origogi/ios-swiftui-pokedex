//
//  BottomSheetButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/29/24.
//

import SwiftUI

struct BottomSheetButton: View {
  let title: String
  let titleColor : Color
  let bgColor : Color
  let onTap: () -> Void

  
  var body: some View {
    HStack(spacing: 8) {
      Text(title)
        .customTextStyle(font: .caption1, color: titleColor)
      Image("ShevronDown")
        .resizable()
        .frame(width: 8, height: 4)
        .foregroundColor(titleColor)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 9)
    .background(bgColor)
    .cornerRadius(49)
    .onTapGesture {
      onTap()
    }
  }
}

#Preview {
  BottomSheetButton(
    title: "All types",
    titleColor: gray800,
    bgColor: .red,
    onTap: {}
  )
}
