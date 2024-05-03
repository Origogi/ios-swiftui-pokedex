//
//  GenderRatioView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/13/24.
//

import SwiftUI

private struct DiagonalStripes: Shape {
  let lineWidth: CGFloat
  let lineSpacing: CGFloat
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    let combinedSpacing = lineWidth + lineSpacing
    let extraLength = sqrt(rect.width * rect.width + rect.height * rect.height)
    
    for x in stride(from: -extraLength, through: rect.width + extraLength, by: combinedSpacing) {
      path.move(to: CGPoint(x: x, y: rect.minY))
      path.addLine(to: CGPoint(x: x - rect.height * tan(.pi / 4), y: rect.maxY))
    }
    
    return path
  }
}

private struct UnknownGenderView : View {
  var body: some View {
    VStack(spacing : 6) {
      DiagonalStripes(lineWidth: 2, lineSpacing: 8)
        .stroke(gray100, lineWidth: 1)
        .clipShape(Rectangle())
        .cornerRadius(50)
        .overlay( // overlay를 사용하여 테두리 추가
          RoundedRectangle(cornerRadius: 50) // 둥근 모서리 사각형
            .stroke(gray100, lineWidth: 1) // 테두리 색상과 두께 설정
        )
        .frame(height: 8)
      Text("Unknown")
        .customTextStyle(font: .caption4, color: .black.opacity(0.7) )
      
    }
    
  }
}

private struct KnownGenderView: View {
  let ratio: Double
  
  var body: some View {
    
    let male = Int(100 * ratio)
    let female = 100 - male;
    
    VStack(spacing : 0) {
      GeometryReader { geometry in
        HStack(spacing: 0) {
          Rectangle()
            .fill(Color(hex: "2551C3"))
            .frame(width: geometry.size.width * ratio)
          Rectangle()
            .fill(Color(hex: "FF7596"))
        }
        .cornerRadius(50)
      }.frame(height: 8)
      HStack {
        HStack(spacing : 6) {
          Image("Male")
            .resizable()
            .scaledToFit()
            .frame(width: 12, height: 12)
          Text("\(male)%")
            .customTextStyle(font: .caption4, color : .black.opacity(0.7))
          
        }
        Spacer()
        HStack(spacing : 4) {
          Image("Female")
            .resizable()
            .scaledToFit()
            .frame(width: 12, height: 12)
          Text("\(female)%")
            .customTextStyle(font: .caption4, color : .black.opacity(0.7))
        }
        
        
        
      }.padding(.top, 6)
    }
  }
}

struct GenderRatioView: View {
  let ratio : Double?
  
  var body: some View {
    VStack(spacing : 0) {
      Text("Gender")
        .customTextStyle(font: .caption4, color : .black.opacity(0.7))
        .padding(.bottom, 8)
      
      if ratio == nil {
        UnknownGenderView()
      } else {
        KnownGenderView(ratio: ratio!)
      }
    }
    
  }
}



#Preview {
  GenderRatioView(ratio: nil)
    .frame(width: 300)
  
}
