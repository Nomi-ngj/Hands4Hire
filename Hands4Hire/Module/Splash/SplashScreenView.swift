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
                //.preferredColorScheme(/*appManager*/.colorScheme)
//                .foregroundColor((appManager.colorScheme == .light ? Theme.color.whiteColor : Theme.color.blackColor).edgesIgnoringSafeArea(.all))
            
            Text(Theme.localized.appName)
                .font(Theme.fonts.title3)
                .foregroundColor(Theme.color.primaryColor)
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
        .onChange(of: appManager.isDarkMode) { newColorScheme in
            // Update ViewModel when the color scheme changes
            //viewModel.updateColors(for: appManager.colorScheme)
        }
        .onChange(of: userColorScheme) { newColorScheme in
            appManager.isDarkMode = newColorScheme == .dark
        }
        .onAppear {
            // Duration of splash screen before transitioning to the next view
            appManager.isDarkMode = userColorScheme == .dark

//            #if DEBUG
//                showSplash = false
//            #else
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Navigate to the next view or perform your transition
                withAnimation {
                    showSplash = false
                }
            }
            
//            #endif
            
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
