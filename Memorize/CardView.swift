//
//  CardView.swift
//  Memorize
//
//  Created by Anshu Vij on 02/01/26.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay (
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
            )
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


#Preview {
    VStack {
        HStack {
            CardView(
                CardView.Card(
                    id: "123",
                    isFaceUp: true,
                    content: "X"
                )
            )
            CardView(
                CardView.Card(
                    id: "1234",
                    content: "XY"
                )
            )
        }
        HStack {
            CardView(
                CardView.Card(
                    id: "123",
                    isFaceUp: true,
                    isMatched: true,
                    content: "X"
                )
            )
            CardView(
                CardView.Card(
                    id: "1234",
                    isMatched: true,
                    content: "XY"
                )
            )
        }
    }
    .padding()
    .foregroundStyle(.green)
}
