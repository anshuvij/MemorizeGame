//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anshu Vij on 18/12/25.
//

import Combine
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "✈️", "🕸️", "😱", "🍟", "🔥","😏"] // will be initialised first then init
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return  MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }
            else {
                return "⁉️"
            }
        }
    }
    
    
    // private allows full separation
   @Published private var model = createMemoryGame()
    
    
    var cards: [Card] {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
}

