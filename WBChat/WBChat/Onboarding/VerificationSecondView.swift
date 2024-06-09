//
//  VirificationSecondView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 05.08.2024.
//

import SwiftUI

struct VerificationSecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var phoneNumber: String
    
    var body: some View {
        ZStack {
            Color.wbBackground.ignoresSafeArea()
            VStack {
                Text("Введите код")
                    .foregroundColor(.wbText)
                    .bold()
                    .font(.title2)
                Text("Отправили код на номер\n +7 \(phoneNumber)")
                    .foregroundColor(.wbText)
                    .multilineTextAlignment(.center)
                    .padding(8)
                CodeFieldView()
                Button(action: {}) {
                    Text("Запросить код повторно")
                        .foregroundStyle(.wbButton)
                        .font(.system(size: 16))
                    
                }
                .padding(.top, 20)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
        }
    }
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.wbText)
        }
    }
        
}

#Preview {
    VerificationSecondView(phoneNumber: "800 555 35 35")
}
