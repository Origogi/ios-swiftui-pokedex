//
//  SortingBottomSheetContent.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import SwiftUI

struct SortingBottomSheetContent: View {
  
  @Binding var isShowing: Bool  // sheet의 표시 상태를 제어하기 위한 바인딩
  let onSelect: (SortingInfo) -> Void  // 선택 콜백
  
  var body: some View {
    VStack {
      HandlerBar()
      VStack {
        Text("Sort by")
          .customTextStyle(font: .title3, color: .black)
        ForEach(SortingInfo.allCases, id: \.self) { sortingInfo in
          Text(sortingInfo.title)
            .customTextStyle(font: .caption3, color: .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
              RoundedRectangle(cornerRadius: 49)
                .fill(gray800)
                .frame(maxWidth: .infinity)
            )
            .onTapGesture {
              onSelect(sortingInfo)  // 선택한 타입을 콜백으로 전달
              isShowing = false  // sheet 닫기
            }
          
        }
      }.padding(.horizontal, 16)
      
    }
  }
}

#Preview {
  SortingBottomSheetContent(
    isShowing: .constant(true),
    onSelect: { _ in }
  )
}
