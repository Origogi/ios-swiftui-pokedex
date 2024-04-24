//
//  RegionPageView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct RegionTabView: View {
  let repository = RegionInfoRepository()
  
    var body: some View {
      ScrollView {
        VStack {
          ForEach(repository.getAll()) { region in
            RegionCard(regionInfo: region)
          }
        }.padding(.horizontal, 16)
      }
    }
}

#Preview {
    RegionTabView()
}
