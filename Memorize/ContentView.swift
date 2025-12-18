//
//  ContentView.swift
//  Memorize
//
//  Created by Anshu Vij on 14/11/25.
//

import SwiftUI

// contentView behaves like a view
struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "✈️", "🕸️", "😱", "🍟", "🔥","😏"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding() // doesn't pass down to internal views
    }
    
    var cards: some View {
        //LazyVGrid takes as minimum space as possible
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp : Bool = true // @State keeps a pointer to isFaceUp thats why since pointer cant change but the isFaceUp can change
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)  // Type Inference
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
