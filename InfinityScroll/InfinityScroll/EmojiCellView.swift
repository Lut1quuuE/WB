//
//  EmojiCellView.swift
//  InfinityScroll
//
//  Created by Ramazan Nazaev on 28.07.2024.
//

import SwiftUI

struct EmojiCellView: View {
    let emoji: String
    let size1: CGSize
    let size2: CGSize
    let size3: CGSize

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: size1.width, height: size1.height)
                        .foregroundStyle(.blue)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: size2.width, height: size2.height)
                        .foregroundStyle(.red)
                }
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: size3.width, height: size3.height)
                    .foregroundStyle(.yellow).opacity(0.7)
            }
            
            Text(emoji)
                .font(.largeTitle)
                .opacity(0.5)
        }
        .frame(height: size1.height + size3.height + 20)
        .padding(.horizontal, 20)
        .foregroundStyle(.black)
        .background(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [3]))
            
        )
    }
}

#Preview {
    EmojiCellView(emoji: "🤩",
                  size1: CGSize(width: 250, height: 70),
                  size2: CGSize(width: 50, height: 70),
                  size3: CGSize(width: 300, height: 30)
    )
}
