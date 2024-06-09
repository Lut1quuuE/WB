//
//  EditContactView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 20.06.2024.
//
import SwiftUI

struct EditContactView: View {
    @Binding var contact: Contact
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            Text("Edit Contact")
                .navigationTitle("EditContactView")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
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
    NavigationView {
        EditContactView(contact: .constant(Contact(
            firstName: "Ваня",
            lastName: "Иванов",
            imageName: "",
            phoneNumber: "+1234567890",
            status: .online,
            lastSeen: nil,
            hasStory: true,
            socialLinks: [
                SocialLink(icon: .facebook, url: "https://facebook.com"),
                SocialLink(icon: .twitter, url: "https://twitter.com"),
                SocialLink(icon: .linkedin, url: "https://linkedin.com"),
                SocialLink(icon: .instagram, url: "https://instagram.com")
            ]
        )))
    }
}
