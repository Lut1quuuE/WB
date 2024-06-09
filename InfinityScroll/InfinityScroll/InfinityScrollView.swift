//
//  InfinityScrollView.swift
//  InfinityScroll
//
//  Created by Ramazan Nazaev on 28.07.2024.
//

import SwiftUI

struct InfinityScrollView: View {
    @State private var items: [EmojiItem] = (1...30).map { _ in EmojiItem.randomItem() }
    
    var body: some View {
        ZStack {
            Color.mint.opacity(0.3).ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(items) { item in
                        EmojiCellView(emoji: item.emoji, size1: item.size1, size2: item.size2, size3: item.size3)
                            .onAppear {
                                if item == items.last {
                                    loadItems()
                                }
                            }
                    }
                }
            }
        }
    }
    
    private func loadItems() {
        let newItems = (1...20).map { _ in EmojiItem.randomItem() }
        items.append(contentsOf: newItems)
    }
}

#Preview {
    InfinityScrollView()
}
