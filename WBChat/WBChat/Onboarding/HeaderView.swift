//
//  HeaderView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI

struct HeaderView: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.title2)
            .foregroundStyle(.wbText)
            .dynamicTypeSize(.xxLarge)
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
}

#Preview {
    HeaderView(text: "Общайтесь с друзьями \nи близкими легко")
}
