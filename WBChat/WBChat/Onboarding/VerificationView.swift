//
//  VerificationView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI

struct VerificationView: View {
    
    var body: some View {
        ZStack {
            Color.wbBackground.ignoresSafeArea()
            VStack {
                Text("Здесь должен быть экран с вводом номера телефона")
            }.navigationTitle("VerificationView")
        }
    }
}

#Preview {
    VerificationView()
}
