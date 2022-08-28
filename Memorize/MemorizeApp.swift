//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marc-Developer on 8/2/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
