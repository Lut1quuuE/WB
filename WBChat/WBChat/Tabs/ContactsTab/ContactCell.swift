//
//  ContactCell.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 19.06.2024.
//

import SwiftUI

struct ContactCell: View {
    var contact: Contact
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ContactDetailsView(contact: contact)) { EmptyView() }
                .opacity(0.0)
            HStack(spacing: 15) {
                if contact.imageName.isEmpty {
                    InitialsView(initials: contact.getInitials())
                        .frame(width: 48, height: 48)
                        .background(Color.wbButton)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            contact.status == .online ? RoundedRectangle(cornerRadius: 16)
                                .fill(Color.green)
                                .frame(width: 10, height: 10)
                                .offset(x: 16, y: -16) : nil
                        )
                        .overlay(
                            contact.hasStory ? RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.blue, lineWidth: 2)
                                .padding(-3) : nil
                        )
                } else {
                    VStack {
                        if let uiImage = UIImage(named: contact.imageName) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 48, height: 48)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .overlay(
                                    contact.status == .online ? RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.green)
                                        .frame(width: 10, height: 10)
                                        .offset(x: 16, y: -16) : nil
                                )
                                .overlay(
                                    contact.hasStory ? RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.blue, lineWidth: 2)
                                        .padding(-3) : nil
                                )
                        } else {
                            InitialsView(initials: contact.getInitials())
                                .frame(width: 48, height: 48)
                                .background(Color.wbButton)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(contact.fullName)
                        .font(.system(size: 14, weight: .medium))
                    
                    Text(contact.statusText)
                                            .font(.system(size: 12))
                                            .foregroundColor(contact.status == .online ? .gray : .gray)
                    
//                    Text(contact.status == .online ? "Онлайн" : "Оффлайн")
//                        .font(.system(size: 12))
//                        .foregroundColor(contact.status == .online ? .gray : .gray)
                }
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    ContactCell(contact: Contact(firstName: "Dead", lastName: "Inside", imageName: "dead_inside", phoneNumber: "+795553535", status: .online, lastSeen: nil, hasStory: false, socialLinks: [
        SocialLink(icon: .twitter, url: "https://twitter.com"),
        SocialLink(icon: .instagram, url: "https://instagram.com"),
        SocialLink(icon: .linkedin, url: "https://linkedin.com"),
        SocialLink(icon: .facebook, url: "https://facebook.com")]))
}
