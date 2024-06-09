//
//  ContactDetailsView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 20.06.2024.
//

import SwiftUI

import SwiftUI

struct ContactDetailsView: View {
    
    @State private var showingEditContactView = false
    @State var contact: Contact
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        ZStack {
            Color.wbBackground.ignoresSafeArea()
            VStack {
                if contact.imageName.isEmpty {
                    Image("wbPerson")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding()
                } else {
                    Image(contact.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding()
                }

                Text(contact.fullName)
                    .font(.custom("SF Pro Display", size: 24))
                    .foregroundStyle(.wbText)
                    .padding(.bottom, 4)

                Text(contact.phoneNumber)
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundStyle(.gray)

                HStack(spacing: 12) {
                    ForEach(contact.socialLinks, id: \.icon) { socialLink in
                        Button(action: {
                            if let url = URL(string: socialLink.url) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image(socialLink.icon)
                                .frame(width: 20, height: 20)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 26)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color.wbBackground))
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.wbButton, lineWidth: 2))
                        }
                    }
                }
                .padding(.top, 25)
            }
            .navigationBarTitle("Контакт", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: editButton)
            .padding()
            .padding(.bottom, 250)
            
            
        }
    }
    private var backButton: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.wbText)
            }
        }

        private var editButton: some View {
            NavigationLink(destination: EditContactView(contact: $contact)) {
                Image("edit")
                    .foregroundColor(.wbText)
            }
        }
    private var contactStatusText: String {
         if contact.status == .online {
             return "Онлайн"
         } else if let lastSeen = contact.lastSeen {
             
             let formatter = DateFormatter()
             
             formatter.dateStyle = .short
             formatter.timeStyle = .short
             return "Был в сети \(formatter.string(from: lastSeen))"
         } else {
             return "Оффлайн"
         }
     }
}

#Preview {
    ContactDetailsView(contact: Contact(
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
    ))
}
