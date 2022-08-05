//
//  ContentView.swift
//  Memorize
//
//  Created by Marc-Developer on 8/2/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "🚀", "🚁", "🚜", "🚌", "🛺", "🚓", "🚒", "🛴", "⛵️"]
    @State private var emojiCount = 4
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}



struct CardView: View {
    var content: String
    @State private var isFaceUp: Bool = true
    let shape = RoundedRectangle(cornerRadius: 25.0)
    
    var body: some View {
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
            .preferredColorScheme(.light)
    }
}

// 8/4/2022 - Pickup from lecture 2 1:00:00
