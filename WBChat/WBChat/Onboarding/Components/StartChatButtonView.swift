//
//  StartChatButtonView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI


struct StartChatButtonView: View {
    var body: some View {
        NavigationLink(destination: VerificationView()) {
            Text("Начать общаться")
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
    StartChatButtonView()
}

