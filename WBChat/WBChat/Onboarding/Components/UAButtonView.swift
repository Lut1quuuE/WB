//
//  UAButtonView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI

struct UAButtonView: View {
    @State private var showSheet = false
    var body: some View {
        Button(action: {
            showSheet.toggle()
        }) {
            Text("Пользовательское соглашение")
                .foregroundStyle(.wbText)
                .font(.caption)
        }
        .sheet(isPresented: $showSheet, content: {
            AgreementView()
        })
    }
}

#Preview {
    UAButtonView()
}
