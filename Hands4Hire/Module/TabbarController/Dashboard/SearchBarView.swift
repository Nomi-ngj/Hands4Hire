//
//  SearchBarView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search for Services", text: $searchText)
                .padding(.horizontal)
                .font(Theme.fonts.footnote)
                .frame(height: 40)
                .background(Color(.systemGray5))
                .cornerRadius(8)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.trailing)
        }
        .padding(.horizontal)
    }
}
