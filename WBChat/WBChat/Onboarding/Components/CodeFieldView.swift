//
//  CodeFieldView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 06.08.2024.
//

import SwiftUI

struct CodeFieldView: View {
    @State private var code: String = ""
    @State private var isCodeCorrect: Bool = false
    let correctCode = "1234"
    var body: some View {
        TextField("Код", text: $code)
            .keyboardType(.numberPad)
            .padding()
            .frame(width: 200, height: 40)
            .background(.textFieldBG)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .onChange(of: code) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered.count <= 4 {
                    code = filtered
                } else {
                    code = String(filtered.prefix(4))
                }
                if code == correctCode {
                    isCodeCorrect = true
                }
            }
            .padding(.vertical, 49)
        NavigationLink(destination: AddProfileView(), isActive: $isCodeCorrect) {
            EmptyView()
        }
    }
}

#Preview {
    CodeFieldView()
}
