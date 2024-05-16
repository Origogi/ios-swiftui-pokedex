//
//  Shimmer퍋ㅈ.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/14/24.
//

import SwiftUI

import SwiftUI

struct ShimmerView: View {
  @State private var shimmerPosition: CGFloat = -1
  
  var animationSpeed: Double = 1.0 // 애니메이션 속도 조정
  var gradientColors: [Color] = [.gray.opacity(0.3), .gray.opacity(0.1), .gray.opacity(0.3)] // 그라데이션 색상 조정
  
  var body: some View {
    GeometryReader { geometry in
      let width = geometry.size.width
      let height = geometry.size.height
      let gradientStart = shimmerPosition
      let gradientEnd = shimmerPosition + 1.5
      
      Rectangle()
        .fill(
          LinearGradient(
            gradient: Gradient(colors: gradientColors),
            startPoint: UnitPoint(x: gradientStart, y: 0.5),
            endPoint: UnitPoint(x: gradientEnd, y: 0.5)
          )
        )
        .frame(width: width, height: height)
        .onAppear {
          withAnimation(Animation.linear(duration: animationSpeed).repeatForever(autoreverses: false)) {
            shimmerPosition = 2
          }
        }
    }
  }
}

#Preview {
  ShimmerView(
  ).frame(width: 200, height: 40)
    .cornerRadius(5)
}
