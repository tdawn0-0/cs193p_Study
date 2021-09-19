//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by 陈建宇 on 2021/9/9.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗", "🚌", "🚑", "🚜", "🛴", "🚲", "🚔", "🛺", "🚘", "🚃", "🚄", "🚠", "🚅", "✈️", "🚀", "🛸", "🚁", "🛶", "🚤", "🚢", "🛳", "🚓", "🚛", "🛵"]

    static func createMemoryGame() -> MemoryGame<String> {
         return MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
