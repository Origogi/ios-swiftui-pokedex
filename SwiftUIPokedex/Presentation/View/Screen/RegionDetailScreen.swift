//
//  RegionDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import SwiftUI

struct RegionDetailScreen: View {
  @ObservedObject var viewModel: RegionDetailViewModel
  
    var body: some View {
      VStack {
        HStack(spacing: 16) {
          BackButton(type: .v2)
          Text(viewModel.regionInfo.regionName)
            .customTextStyle(font: .title2)
          Spacer()
        }
        .padding(.horizontal, 16)
        PokemonCardListView(list: viewModel.list)
      }.navigationBarHidden(true)

    }
}

#Preview {
    RegionDetailScreen(
      viewModel: RegionDetailViewModel(
        regionInfo: RegionInfoRepository().list().first!)
    )
}
