//
//  SwiftUIPokedexApp.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/20/24.
//

import SwiftUI

@main
struct SwiftUIPokedexApp: App {
  
  @State private var appData = AppData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
