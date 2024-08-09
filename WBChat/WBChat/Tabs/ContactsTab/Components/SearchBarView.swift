//
//  SearchBarView.swift
//  WBChat
//
//  Created by Ramazan Nazaev on 13.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                TextField("Search", text: $searchText)
                    .padding(2)
                    .padding(.leading, -10)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 25)
    }
}
struct SearchBarView_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBarView(searchText: $searchText)
    }
}
