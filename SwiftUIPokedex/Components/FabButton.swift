//
//  FabButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/26/24.
//

import SwiftUI

struct FabButton: View {
  
  @Binding var isFav : Bool
  
  init(isFav: Binding<Bool>) {
    self._isFav = isFav
  }
  
  var body: some View {
    Button (action: {
      isFav.toggle()
    }, label: {
      Image(isFav ? "SmallFavOn" : "SmallFavOff")
        .resizable()
      
    })
    .frame(width: 32, height: 32)
  }
}

#Preview {
  FabButton(
    isFav: .constant(true)
  )
}
