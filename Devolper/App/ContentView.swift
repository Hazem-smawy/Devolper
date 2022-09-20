//
//  ContentView.swift
//  Devolper
//
//  Created by hazem smawy on 9/20/22.
//

import SwiftUI

struct ContentView: View {
    let cards :[Card] = cardsData
    // MARK: - Content
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(20)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
