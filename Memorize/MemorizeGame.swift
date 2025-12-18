//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anshu Vij on 18/12/25.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    var cards: [Card]
    
    func choose(card : Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
