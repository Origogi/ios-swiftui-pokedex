//
//  SwiftUIView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/7/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct PokemonDetailImageView: View {
  
  let detailImageInfo : PokemonDetailImageInfo
  @State private var isAnimating = true
  
  init(detailImageInfo: PokemonDetailImageInfo) {
    self.detailImageInfo = detailImageInfo
  }
  
  var body: some View {
    AnimatedImage(name: detailImageInfo.gifFileName)
      .maxBufferSize(.max)
      .scaledToFit()
      .frame(width: detailImageInfo.width, height: detailImageInfo.height)
    
  }
}

#Preview {
  PokemonDetailImageView(detailImageInfo: AppData().pokemons.first!.detailImageInfo
  )
}
