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
    AnimatedImage(
      url: URL(string: detailImageInfo.gifImageUrl)
    )
      .maxBufferSize(.max)
      .scaledToFit()
      .frame(width: detailImageInfo.width, height: detailImageInfo.height)
    
  }
}

#Preview {
  PokemonDetailImageView(detailImageInfo: PokemonDataRepository().list().first!.detailImageInfo!
  )
}
