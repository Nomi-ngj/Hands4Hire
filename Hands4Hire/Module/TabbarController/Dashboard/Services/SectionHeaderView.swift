//
//  SectionHeaderView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct SectionHeaderView: View {
    var title: String
    var shouldShow = true
    var onSeeAllTapped: (() -> Void)? = nil  // Callback closure for button action

    @EnvironmentObject var appManager: AppContainerManager
    
    var body: some View {
        HStack {
            Text(localized: title.localized())
                .font(Theme.fonts.headline)
                .foregroundColor(appManager.theme.color.primaryColor)
            
            Spacer()
            if shouldShow{
                Button(action: {
                    self.onSeeAllTapped?()
                }) {
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .foregroundColor(appManager.theme.color.primaryColor)
                }
            } 
        }
        .padding(.horizontal)
    }
}
