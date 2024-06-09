//
//  ContinueButtonView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 05.08.2024.
//

import SwiftUI

struct ContinueButtonView: View {
    var body: some View {
        NavigationLink(destination: VerificationSecondView(phoneNumber: "")) {
            Text("Продолжить")
                .bold()
                .padding()
                .frame(width: 330)
                .background(Color.wbButton)
                .foregroundColor(.white)
                .cornerRadius(30)
        }
    }
}

#Preview {
    ContinueButtonView()
}
