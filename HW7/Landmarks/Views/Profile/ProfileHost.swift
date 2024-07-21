//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(isEditing: $isEditing, profile: $draftProfile)
                .onAppear {
                      if let loadedProfile = UserDefaults.standard.loadProfile() {
                          draftProfile = loadedProfile
                      } else {
                          draftProfile = Profile.default
                      }
                  }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {
                    isEditing = true
                }) {
                    Text("✏️")
                }
            }
        }
        .toolbarTitleDisplayMode(.inline)
    }
}


