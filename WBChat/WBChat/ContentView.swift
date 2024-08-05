//
//  ContentView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 09.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.wbBackground.ignoresSafeArea()
                VStack {
                    ImageView()
                        .padding(.top, 100)
                    HeaderView(text: "Общайтесь с друзьями \nи близкими легко")
                        .padding(.top, 45)
                    Spacer()
                    UAButtonView()
                    StartChatButtonView()
                        .padding(.bottom, 20)
                }
            }
            Color.wbBackground.ignoresSafeArea()
        }.navigationTitle("Onboarding")
    }
}
#Preview {
    ContentView()
}
