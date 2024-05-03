//
//  FilterByTypeBottomSheet.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/29/24.
//

import SwiftUI

struct FilterBottomSheetContent: View {
  @Binding var isShowing: Bool  // sheet의 표시 상태를 제어하기 위한 바인딩
  let onSelect: (PokemonTypeInfo?) -> Void  // 선택 콜백
  
  var body: some View {
    VStack {
      HandlerBar()
      VStack {
        Text("Select the type")
          .customTextStyle(font: .title3, color: .black)
        ScrollView {
          Text("All Types")
            .customTextStyle(font: .caption3, color: .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
              RoundedRectangle(cornerRadius: 49)
                .fill(gray800)
                .frame(maxWidth: .infinity)
            )
            .onTapGesture {
              onSelect(nil)  // 선택한 타입을 콜백으로 전달
              isShowing = false  // sheet 닫기
            }
            .padding(.horizontal, 16)
          
          ForEach(PokemonTypeInfo.allCases, id: \.self) { type in
            Text(type.name)
              .customTextStyle(font: .caption3, color: type.textColorOnPrimaryColorBg)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 8)
              .background(
                RoundedRectangle(cornerRadius: 49)
                  .fill(type.primaryColor)
                  .frame(maxWidth: .infinity)
              )
              .onTapGesture {
                onSelect(type)  // 선택한 타입을 콜백으로 전달
                isShowing = false  // sheet 닫기
              }
          }
          .padding(.horizontal, 16)
    
        }
      }
      
    }
  }
}



#Preview {
  FilterBottomSheetContent(
    isShowing: .constant(true),
    onSelect: { _ in }
  )
}
