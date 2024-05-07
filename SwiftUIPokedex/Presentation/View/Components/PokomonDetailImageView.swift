//
//  SwiftUIView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/7/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct PokemonDetailImageView: View {
  
  let imageUrl : String
  let maxWidth: CGFloat
  let maxHeight: CGFloat
  
  @State var imageSize: CGSize = CGSize(width: 0, height: 0)
  
  init(
    imageUrl: String,
    maxWidth: CGFloat,
    maxHeight: CGFloat) {
      
      self.imageUrl = imageUrl
      self.maxWidth = maxWidth
      self.maxHeight = maxHeight
    }
  
  var body: some View {
    
    AnimatedImage(
      url: URL(string: imageUrl)
    )
    .resizable()
    .onSuccess { image, _, _ in
      DispatchQueue.main.async {
        let width = min(image.size.width * 2.5, maxWidth)
        let height = min(image.size.height * 2.5, maxHeight)
        
        imageSize = CGSize(width: width, height: height)
      }
    }
    .maxBufferSize(.max)
    .resizable()
    .scaledToFit()
    .frame(width : imageSize.width, height: imageSize.height)
    
  }
  
}

#Preview {
  PokemonDetailImageView(imageUrl: "https://projectpokemon.org/images/normal-sprite/chikorita.gif",
                         maxWidth: 200,
                          maxHeight: 200
  )
}
