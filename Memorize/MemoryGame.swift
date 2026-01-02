//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anshu Vij on 18/12/25.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2cards
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
    }
    
    var indexOfOneAndOnlyFaceUp : Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp}.only }
        set { cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0)} }
    }
    
    mutating func choose(card : Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialIndex = indexOfOneAndOnlyFaceUp {
                    if cards[chosenIndex].content == cards[potentialIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialIndex].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUp = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id) : \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        var id: String
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
    }
}
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
