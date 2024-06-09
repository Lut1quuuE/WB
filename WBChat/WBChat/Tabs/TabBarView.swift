//
//  TabBarView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 13.06.2024.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        NavigationView {
            TabView {
                ContactsTabView()
                    .tabItem {
                        Image("variant_group")
                            .renderingMode(.template)
                            .foregroundColor(.wbText)
                            .frame(width: 58, height: 44)
                    }
                
                ChatsTabView()
                    .tabItem{
                        Image("variant_message_circle")
                            .renderingMode(.template)
                            .foregroundColor(.wbText)
                            .frame(width: 58, height: 44)
                    }
                
                MoreTabView()
                    .tabItem{
                        Image("variant_more_horizontal")
                            .renderingMode(.template)
                            .foregroundColor(.wbText)
                            .frame(width: 58, height: 44)
                        
                    }
            }
        }
        .accentColor(.wbText)
    }
}

#Preview {
    TabBarView()
}
