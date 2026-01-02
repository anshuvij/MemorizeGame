//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Anshu Vij on 14/11/25.
//

import SwiftUI

// contentView behaves like a view
struct EmojiMemoryGameView: View {
    let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding() // doesn't pass down to internal views
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundStyle(.orange)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
