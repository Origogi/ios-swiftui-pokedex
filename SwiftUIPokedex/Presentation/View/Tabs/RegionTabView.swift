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

      VStack(alignment: .leading, spacing : 12) {
        
        Text("Regions")
          .customTextStyle(font: .title2)
          .padding(.horizontal, 16)
          .padding(.vertical, 20)

        Divider()
        ForEach(repository.getAll()) { region in
          RegionCard(regionInfo: region)
        }
        .padding(.horizontal, 16)
        

      }.padding(.bottom, 16)
    }
  }
}

#Preview {
  RegionTabView()
}
