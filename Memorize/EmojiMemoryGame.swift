//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by 陈建宇 on 2021/9/9.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static var emojis = ["🚗", "🚌", "🚑", "🚜", "🛴", "🚲", "🚔", "🛺", "🚘", "🚃", "🚄", "🚠", "🚅", "✈️", "🚀", "🛸", "🚁", "🛶", "🚤", "🚢", "🛳", "🚓", "🚛", "🛵"]
    static var color = Color.red
    static func createMemoryGame() -> MemoryGame<String> {
        emojis.shuffle()
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
    
    func getScore() -> Int {
        model.score
    }
    
    func newGame(){
        EmojiMemoryGame.emojis = gameTheme.emojis[Int.random(in: 0..<gameTheme.emojis.count)]
        EmojiMemoryGame.color = gameTheme.color[Int.random(in: 0..<gameTheme.color.count)]
        model = EmojiMemoryGame.createMemoryGame();
    }
}
