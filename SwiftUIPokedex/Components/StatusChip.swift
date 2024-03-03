//
//  StatusChip.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/3/24.
//

import SwiftUI

struct StatusChip: View {
  let statusName: String
  let value : String
  let iconPath: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack(spacing: 6) {
        Image(iconPath)
          .resizable()
          .frame(width: 20, height: 20)
        Text(statusName)
          .font(.custom("Poppins-Medium", size: 12))
          .foregroundColor(Color(hex: "#333333").opacity(0.7))
          
      }
      Text(value)
        .font(.custom("Poppins-Medium", size: 18))
        .foregroundColor(Color.black).opacity(0.9)
        .padding(.vertical, 8 )
        .frame(width: .infinity)
    }
  }
}

#Preview {
  StatusChip(
    statusName: "Weight",
    value: "5.2 kg",
    iconPath: "Weight"
  )
}
