import SwiftUI

struct SwipeableView<Content: View>: View {
  @State private var offset: CGFloat = 0
  @State private var isDeleting: Bool = false
  private let swipeThreshold: CGFloat = 80
  
  let content: () -> Content
  let onDelete: () -> Void


  var body: some View {
    ZStack {
      // Background with trailing icon
      HStack {
        Spacer()
        Image(systemName: "trash")
          .foregroundColor(.white)
          .frame(maxHeight: .infinity)
          .padding()
          .onTapGesture {
            // Slide content to the left and trigger delete callback
            withAnimation {
              offset = -UIScreen.main.bounds.width // Move content left fully
            }
            isDeleting = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
              onDelete()
            }
          }
      }
      .background(Color.red)
      
      // Main content that slides on swipe
      content()
        .offset(x: offset)
        .gesture(
          DragGesture()
            .onChanged { value in
              // Allow swiping left only if not already deleting
              if !isDeleting && value.translation.width < 0 {
                offset = value.translation.width
              }
            }
            .onEnded { value in
              // Check if swipe exceeded threshold
              if !isDeleting && value.translation.width < -swipeThreshold {
                withAnimation {
                  offset = -100 // Custom offset for full swipe
                }
              } else {
                // Reset offset if not swiped enough
                withAnimation {
                  offset = 0
                }
              }
            }
        )
    }
  }
}
