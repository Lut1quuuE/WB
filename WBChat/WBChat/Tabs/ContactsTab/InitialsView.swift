//
//  InitialsView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 19.06.2024.
//

import SwiftUI

struct InitialsView: View {
    var initials: String
    
    var body: some View {
        Text(initials)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold))
            .multilineTextAlignment(.center)
    }
}
