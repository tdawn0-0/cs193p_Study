//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 陈建宇 on 2021/9/2.
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
