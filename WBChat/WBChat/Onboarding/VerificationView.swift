//
//  VerificationView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var phoneNumber: String = ""
    var body: some View {
        ZStack {
            Color.wbBackground.ignoresSafeArea()
            VStack {
                Text("Введите номер телефона")
                    .foregroundColor(.wbText)
                    .bold()
                    .font(.title2)
                Text("Мы вышлем код подтверждения\n на указанный номер")
                    .foregroundColor(.wbText)
                    .multilineTextAlignment(.center)
                    .padding(8)
                NumberFieldView(number: $phoneNumber, isNumber: !phoneNumber.isEmpty)
                    .padding(.top, 49)
                    .padding(.bottom, 81)
                    .padding(.horizontal, 24)
                ContinueButtonView()
            }.padding(.bottom, 100)
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
    VerificationView()
}
