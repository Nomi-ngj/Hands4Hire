//
//  UnderConstructionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct UnderConstructionView: View {
    var message: String = "This feature is under construction"
    @EnvironmentObject var appManager: AppContainerManager
    var body: some View {
        ZStack {
            // Background color
            (appManager.theme.color.whiteColor)
                .edgesIgnoringSafeArea(.all)
            
            // Content
            VStack {
                // Warning Icon
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.appWarning)
                    .frame(width: 100, height: 100)
                
                // Message
                Text(message)
                    .font(Theme.fonts.title2)
                    .foregroundColor(appManager.theme.color.blackColor)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            .background(appManager.theme.color.whiteColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
        }
    }
}
