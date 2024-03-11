//
//  BigFavButton.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/10/24.
//

import SwiftUI

struct BigFavButton: View {
  @Binding var isFav : Bool
  
  init(isFav: Binding<Bool>) {
    self._isFav = isFav
  }
  
  
  var body: some View {
    Button (action: {
      isFav.toggle()
    }, label: {
      Image(isFav ? "BigFavOn" : "BigFavOff")
        .resizable()
      
    })
    .frame(width: 28, height: 28)
  }
}

#Preview {
  BigFavButton(
    isFav: .constant(true)
    
  )
}
