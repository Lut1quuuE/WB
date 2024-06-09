//
//  NumberFieldView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 05.08.2024.
//

import SwiftUI

struct NumberFieldView: View {
    @Binding var number: String
    var isNumber: Bool = false
    var body: some View {
        HStack {
            CountryOfNumber(isNumber: isNumber)
            TextField("000 000-00-00", text: $number)
                .onChange(of: number, { _, newValue in
                    self.number = formatPhoneNumber(newValue)
                })
                .padding(.vertical, 6)
                .padding(.leading, 8)
                .background(RoundedRectangle(cornerRadius: 4)
                    .fill(.textFieldBG))
                .bold()
                .keyboardType(.numberPad)
        }
    }
    
    private func formatPhoneNumber(_ number: String) -> String {
            let digits = number.filter { $0.isNumber }
            var formattedNumber = ""

            for (index, digit) in digits.enumerated() {
                if index == 3 || index == 6 || index == 8 || index == 10 {
                    formattedNumber += " "
                }
                formattedNumber.append(digit)
            }
            return String(formattedNumber.prefix(13))
        }
}

#Preview {
    NumberFieldView(number: .constant(""))
}
