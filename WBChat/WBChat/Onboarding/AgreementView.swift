//
//  AgreementView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI

struct AgreementView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.wbBackground.ignoresSafeArea()
            VStack {
                Text("Пользовательское соглашение")
                    .font(.title2)
                    .padding()
                Text("Текст соглашения")
                    .padding()
                Button("Закрыть") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    AgreementView()
}
