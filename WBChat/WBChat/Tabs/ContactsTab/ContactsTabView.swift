//
//  ContactsTabView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 13.06.2024.
//

import SwiftUI

struct ContactsTabView: View {
    
    @State var searchText = ""
    @State private var contacts = [
        Contact(firstName: "Ivan", lastName: "Ivanov", imageName: "ramazan_image", phoneNumber: "+795553535", status: .offline, lastSeen: Date(timeIntervalSinceNow: -36000), hasStory: false, socialLinks: [
            SocialLink(icon: .twitter, url: "https://twitter.com"),
            SocialLink(icon: .instagram, url: "https://instagram.com"),
            SocialLink(icon: .linkedin, url: "https://linkedin.com"),
            SocialLink(icon: .facebook, url: "https://facebook.com")]),
        Contact(firstName: "Arsen", lastName: "Markaryan", imageName: "arsen", phoneNumber: "+795553535", status: .online, lastSeen: nil, hasStory: true, socialLinks: [
            SocialLink(icon: .twitter, url: "https://twitter.com"),
            SocialLink(icon: .instagram, url: "https://instagram.com"),
            SocialLink(icon: .linkedin, url: "https://linkedin.com"),
            SocialLink(icon: .facebook, url: "https://facebook.com")]),
        Contact(firstName: "Dead", lastName: "Inside", imageName: "dead_inside", phoneNumber: "+795553535", status: .online, lastSeen: nil, hasStory: false, socialLinks: [
            SocialLink(icon: .twitter, url: "https://twitter.com"),
            SocialLink(icon: .instagram, url: "https://instagram.com"),
            SocialLink(icon: .linkedin, url: "https://linkedin.com"),
            SocialLink(icon: .facebook, url: "https://facebook.com")]),
        Contact(firstName: "Maria", lastName: "Vasilyeva", imageName: "", phoneNumber: "+795553535", status: .offline, lastSeen: Date(timeIntervalSinceNow: -3600), hasStory: false, socialLinks: [
            SocialLink(icon: .twitter, url: "https://twitter.com"),
            SocialLink(icon: .instagram, url: "https://instagram.com"),
            SocialLink(icon: .linkedin, url: "https://linkedin.com"),
            SocialLink(icon: .facebook, url: "https://facebook.com")]),
        Contact(firstName: "Vasya", lastName: "Pupkin", imageName: "", phoneNumber: "+795553535", status: .online, lastSeen: nil, hasStory: true, socialLinks: [
            SocialLink(icon: .twitter, url: "https://twitter.com"),
            SocialLink(icon: .instagram, url: "https://instagram.com"),
            SocialLink(icon: .linkedin, url: "https://linkedin.com"),
            SocialLink(icon: .facebook, url: "https://facebook.com")]),
        Contact(firstName: "Alex", lastName: "Ovechkin", imageName: "alex_image", phoneNumber: "+795553535", status: .offline, lastSeen: Date(timeIntervalSinceNow: -1800), hasStory: true, socialLinks: [
            SocialLink(icon: .twitter, url: "https://twitter.com"),
            SocialLink(icon: .instagram, url: "https://instagram.com"),
            SocialLink(icon: .linkedin, url: "https://linkedin.com"),
            SocialLink(icon: .facebook, url: "https://facebook.com")])]

var body: some View {
        NavigationView {
            ZStack {
                Color.wbBackground.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack {
                        Text("Контакты")
                            .font(.custom("SF Pro Display", size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(.wbText)
                    
                        Spacer()
                        
                        NavigationLink(destination: AddContactView()) {
                            Image("variant_plus")
                                .foregroundStyle(.wbText)
                                .frame(width: 14, height: 14)
                        }
                    }
                    .padding(.top, 14)
                    .padding(.bottom, 14)
                    .padding(.horizontal, 24)
                    
                    SearchBarView(searchText: $searchText)
                        .padding(.bottom, -20)
                        .padding(.horizontal, 10)
                    
                    List {
                        ForEach(contacts.filter {
                            self.searchText.isEmpty ? true : $0.fullName.localizedCaseInsensitiveContains(searchText)
                        }, id: \.id) { contact in
                            ContactCell(contact: contact)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                        }
                        .listRowInsets(EdgeInsets())
                        .background(Color.wbBackground)
                        
                    }
                    .listStyle(PlainListStyle())
                    .padding(14)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    ContactsTabView()
}
