import SwiftUI

struct SwipeableView<Content: View>: View {
    @State private var offset: CGFloat = 0
    @State private var isSwipeActive: Bool = false
    var content: () -> Content
    var onDelete: () -> Void
    var onTapAction: () -> Void

    var body: some View {
        ZStack {
            // 우측에 삭제 아이콘을 표시하는 백그라운드
            HStack {
                Spacer()
                Image(systemName: "trash")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
                    .padding(
                        32
                    )
                    .frame(
                        maxHeight: .infinity
                    )
                    .onTapGesture {
                        // 삭제 동작을 트리거
                        withAnimation {
                            offset = -UIScreen.main.bounds.width // 콘텐츠를 왼쪽으로 완전히 이동
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            onDelete()
                        }
                    }
            }
            .background(Color.red)

            // 스와이프 시 콘텐츠가 움직이는 메인 컨텐츠
            content()
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // 스와이프가 활성화된 경우에만 왼쪽으로 스와이프 허용
                            if value.translation.width < 0 {
                                offset = value.translation.width
                                isSwipeActive = true
                            }
                        }
                        .onEnded { value in
                            // 스와이프가 기준을 초과했는지 확인
                            if value.translation.width < -80 {
                                withAnimation {
                                    offset = -100 // 스와이프를 완전히 적용
                                }
                            } else {
                                // 충분히 스와이프되지 않은 경우 오프셋을 재설정
                                withAnimation {
                                    offset = 0
                                    isSwipeActive = false
                                }
                            }
                        }
                )
                .onTapGesture {
                    // Reset swipe and trigger onTapAction if swipe is not active
                    if !isSwipeActive {
                        onTapAction()
                    } else {
                        withAnimation {
                            offset = 0
                            isSwipeActive = false
                        }
                    }
                }
        }.onAppear {
            offset = 0
            isSwipeActive = false
        }
    }
}
