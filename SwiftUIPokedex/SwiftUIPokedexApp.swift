//
//  SwiftUIPokedexApp.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/20/24.
//

import SwiftUI

@main
struct SwiftUIPokedexApp: App {
    @State private var showMainView = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showMainView {
                    HomeScreen()
                } else {
                    SplashScreen()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    showMainView = true
                                }
                            }
                        }
                }
            }.animation(.default, value: showMainView)
        }
    }
}
