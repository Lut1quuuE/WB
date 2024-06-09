//
//  Contact.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 19.06.2024.
//

import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    let imageName: String
    var phoneNumber: String
    let status: ContactStatus
    let lastSeen: Date?
    let hasStory: Bool
    let socialLinks: [SocialLink]
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var statusText: String {
        if status == .online {
            return "Онлайн"
        } else if let lastSeen = lastSeen {
            let timeInterval = Date().timeIntervalSince(lastSeen)
            let minutes = Int(timeInterval / 60)
            let hours = Int(timeInterval / 3600)
            let days = Int(timeInterval / 86400)
            
            if minutes < 60 {
                return "Last seen \(minutes) minutes ago"
            } else if hours < 24, hours > 1 {
                return "Last seen \(hours) hours ago"
            } else if hours == 1 {
                return "Last seen \(hours) hour ago"
            } else {
                return "Last seen \(days) days ago"
            }
        } else {
            return "Оффлайн"
        }
    }
    
    func getInitials() -> String {
            let initials = "\(firstName.first ?? "-")\(lastName.first ?? "-")"
            return initials.uppercased()
        }
    
    
    enum ContactStatus {
        case online
        case offline
    }
}
