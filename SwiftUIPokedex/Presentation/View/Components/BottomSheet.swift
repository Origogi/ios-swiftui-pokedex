//
//  BottomSheet.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/29/24.
//

import SwiftUI


struct BottomSheetView: View {
  @Binding var isShowing: Bool
  @State private var offset = CGSize.zero // 시트의 위치를 조정하기 위한 상태 변수
  
  var body: some View {
    ZStack(alignment: .bottom) {
      if isShowing {
        Color.black
          .opacity(0.3)
          .ignoresSafeArea()
          .onTapGesture {
            withAnimation {
              isShowing = false
            }
          }
        
        VStack {
          Text("Hello sheet!")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .background(Color.white)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .transition(.move(edge: .bottom))
        .offset(y: max(0, offset.height)) // 드래그 중이거나, 드래그가 완료된 위치에서 시트를 그립니다.
        .gesture(
          DragGesture()
            .onChanged { drag in
              self.offset = drag.translation
            }
            .onEnded { drag in
              if drag.translation.height > 100 {
                withAnimation {
                  isShowing = false
                }
              }
              offset = .zero // 드래그가 끝난 후, 오프셋을 초기화
            }
        )
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    .ignoresSafeArea()
    .animation(.easeInOut, value: isShowing)
  }
}
