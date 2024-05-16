//
//  ShimmerModifier.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/16/24.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
  @State private var shimmerPosition: CGFloat = -1
  
  var animationSpeed: Double
  var gradientColors: [Color]
  
  func body(content: Content) -> some View {
    content
      .overlay(
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
      )
      .mask(content)
  }
}

extension View {
  func shimmer(
    animationSpeed: Double = 1.0,
    gradientColors: [Color] = [.gray.opacity(0.3), .gray.opacity(0.1), .gray.opacity(0.3)]
  ) -> some View {
    self.modifier(ShimmerModifier(animationSpeed: animationSpeed, gradientColors: gradientColors))
  }
}
