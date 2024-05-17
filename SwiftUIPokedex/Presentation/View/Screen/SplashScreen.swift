//
//  SplashScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/3/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(
                    width: 120,
                    height: 120
                )
        }
    }
}

#Preview {
    SplashScreen()
}
