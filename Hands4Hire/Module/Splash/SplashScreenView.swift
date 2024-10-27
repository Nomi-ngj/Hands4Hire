//
//  SplashScreenView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    
    @Binding var showSplash: Bool

    @State private var logoOpacity = 0.0
    @State private var taglineOpacity = 0.0
    @State private var taglineOffset: CGFloat = 0
    @EnvironmentObject var appManager: AppContainerManager
    @Environment(\.colorScheme) private var userColorScheme
    var body: some View {
        VStack {
            Spacer()
            
            Image("Nouman Gul") // Replace with your logo asset
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .opacity(logoOpacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        logoOpacity = 1.0
                    }
                }
            
            Text(Theme.localized.appName)
                .font(Theme.fonts.title3)
                .foregroundColor(appManager.theme.color.primaryColor)
                .opacity(taglineOpacity)
                .offset(y: taglineOffset)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0).delay(0.5)) {
                        taglineOpacity = 1.0
                        taglineOffset = 0
                    }
                }
            
            Spacer()
        }
        .background(Color.clear)
        .onAppear {
            // Duration of splash screen before transitioning to the next view
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Navigate to the next view or perform your transition
                withAnimation {
                    showSplash = false
                }
            }
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
