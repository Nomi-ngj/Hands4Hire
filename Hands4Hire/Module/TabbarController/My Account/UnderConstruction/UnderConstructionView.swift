//
//  UnderConstructionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct UnderConstructionView: View {
    var message: String = "This feature is under construction"
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            // Background color
            (colorScheme == .dark ? Theme.color.blackColor:Theme.color.whiteColor)
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
                    .foregroundColor((colorScheme == .light ? Theme.color.blackColor:Theme.color.whiteColor))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .shadow(radius: 10)
            .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
        }
    }
}
