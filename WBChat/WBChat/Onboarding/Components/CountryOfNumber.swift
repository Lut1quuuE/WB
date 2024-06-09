//
//  CountryOfNumber.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 05.08.2024.
//

import SwiftUI

struct CountryOfNumber: View {
    var isNumber: Bool = false
    var body: some View {
        HStack {
            Text("🇷🇺")
            Text("+7")
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(.textFieldBG))
        .foregroundStyle(.wbText)
        .bold()
    }
}

#Preview {
    CountryOfNumber(isNumber: false)
}
