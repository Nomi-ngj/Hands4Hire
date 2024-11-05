//
//  SplashScreenView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

class SplashScreenViewModel: ObservableObject {
    @Published var logoOpacity: Double = 0.0
    @Published var taglineOpacity: Double = 0.0
    @Published var taglineOffset: CGFloat = 0.0
    
    func startAnimations() {
        withAnimation(.easeIn(duration: 1.0)) {
            logoOpacity = 1.0
        }
        withAnimation(.easeIn(duration: 1.0).delay(0.5)) {
            taglineOpacity = 1.0
            taglineOffset = 0
        }
    }
}

struct SplashScreenView: View {
    
    @Binding var showSplash: Bool
    @ObservedObject var viewModel: SplashScreenViewModel // Accept viewModel as a parameter
    @EnvironmentObject var appManager: AppContainerManager
    @Environment(\.colorScheme) private var userColorScheme
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("Nouman Gul")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .opacity(viewModel.logoOpacity) // Use ViewModel's opacity
                .onAppear {
                    viewModel.startAnimations()
                }
            
            Text(Theme.localized.appName)
                .font(Theme.fonts.title3)
                .foregroundColor(appManager.theme.color.primaryColor)
                .opacity(viewModel.taglineOpacity) // Use ViewModel's opacity
                .offset(y: viewModel.taglineOffset) // Use ViewModel's offset
            
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


//struct SplashScreenView: View {
//    
//    @Binding var showSplash: Bool
//
//    @ObservedObject var viewModel = SplashScreenViewModel()
//    @EnvironmentObject var appManager: AppContainerManager
//    @Environment(\.colorScheme) private var userColorScheme
//    var body: some View {
//        VStack {
//            Spacer()
//            
//            Image("Nouman Gul")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 150, height: 150)
//                .opacity(viewModel.logoOpacity) // Use ViewModel's opacity
//                .onAppear {
//                    viewModel.startAnimations()
//                }
//            
//            Text(Theme.localized.appName)
//                .font(Theme.fonts.title3)
//                .foregroundColor(appManager.theme.color.primaryColor)
//                .opacity(viewModel.taglineOpacity) // Use ViewModel's opacity
//                .offset(y: viewModel.taglineOffset) // Use ViewModel's offset
//            
//            Spacer()
//        }
//        .background(Color.clear)
//        .onAppear {
//            // Duration of splash screen before transitioning to the next view
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                // Navigate to the next view or perform your transition
//                withAnimation {
//                    showSplash = false
//                }
//            }
//        }
//        .preferredColorScheme(appManager.colorScheme)
//    }
//}
