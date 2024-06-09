//
//  SocialLink.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 20.06.2024.
//

import SwiftUI

struct SocialLink {
    enum SocialMedia {
        case facebook
        case twitter
        case linkedin
        case instagram
    }
    
    let icon: String
    let url: String
    
    init(icon: SocialMedia, url: String) {
        let iconString: String
        switch icon {
        case .facebook:
            iconString = "social_facebook"
        case .twitter:
            iconString = "social_twitter"
        case .linkedin:
            iconString = "social_linkedin"
        case .instagram:
            iconString = "social_inst"
        }
        self.icon = iconString
        self.url = url
    }
}
