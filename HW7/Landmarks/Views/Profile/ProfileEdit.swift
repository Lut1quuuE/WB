//
//  ProfileEdit.swift
//  Landmarks
//
//  Created by Ramazan Nazaev on 20.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEdit: View {
    @Binding var profile: Profile
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Edit")
                    .padding(.top,  20)
                    .padding(.leading, 20)
                    .font(.title)
                    .bold()
                
                List {
                    HStack {
                        Text("Username")
                        
                        TextField("Username", text: $profile.username)
                            .multilineTextAlignment(.trailing)
                            .bold()
                    }
                    Toggle(isOn: $profile.prefersNotifications) {
                        Text("Enable Notifications")
                    }
                    Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                        ForEach(Profile.Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    DatePicker(
                        selection: $profile.goalDate,
                        displayedComponents: .date
                    ){
                        Text("Goal Date")
                    }
                }
                .listStyle(PlainListStyle())
                Button {
                    saveProfile()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15)
                            .fill(.cyan).opacity(0.7))
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal, 30)
                    
                }
            }
            .navigationBarItems(leading: backButton)
        }
    }
    
    private var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.blue)
            }
        }
    
    private func saveProfile() {
        UserDefaults.standard.saveProfile(profile)
    }
}

#Preview {
    ProfileEdit(profile: .constant(.default))
}
