//
//  MyAccountView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import Foundation
import UIKit
import SwiftUI

struct MyAccountView: View {
    @StateObject var viewModel: MyAccountViewModel = .init(user: User.user, colorScheme: .light)
    @State private var selectedSection: MyAccountSection?
    @Environment(\.colorScheme) private var userColorScheme
    @EnvironmentObject var appManager: AppContainerManager

    var body: some View {
        VStack {
            List(MyAccountSection.allCases) { section in
                NavigationLink(
                    destination: destinationView(for: section),
                    tag: section,
                    selection: $selectedSection
                ) {
                    HStack {
                        Text(viewModel.sectionTitle(for: section))
                            .font(Theme.fonts.caption1)
                            .foregroundColor(viewModel.primaryColor) // This should reflect the updated color
                            
                    }
                    
                }
            }
            .onChange(of: userColorScheme) { newColorScheme in
                appManager.isDarkMode = newColorScheme == .dark
            }
            .onChange(of: appManager.isDarkMode) { newColorScheme in
                // Update ViewModel when the color scheme changes
                viewModel.updateColorScheme(appManager.colorScheme)
            }
            .onAppear {
                viewModel.updateColorScheme(appManager.colorScheme)
            }
            .preferredColorScheme(appManager.colorScheme)
            .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
        }
    }

    func destinationView(for section: MyAccountSection) -> some View {
        let title = viewModel.sectionTitle(for: section)
        let underConstruction = UnderConstructionView()
            .toolbar {
                ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                    Text(title)
                        .font(Theme.fonts.headline) // Customize font, size, and weight
                }
            }
            .customBackButton()
        
        switch section {
        case .profile:
            // Navigate to Profile View
            debugPrint("Profile selected")
            let view = ProfileView(user: viewModel.user)
                .toolbar {
                    ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                        Text(title)
                            .font(Theme.fonts.headline) // Customize font, size, and weight
                    }
                }
                .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
                .customBackButton()
                .environmentObject(appManager)
            
            return AnyView(view)
            
        case .settings:
            // Navigate to Settings View
            debugPrint("Settings selected")
            let view = SettingsView()
                .toolbar {
                    ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                        Text(title)
                            .font(Theme.fonts.headline) // Customize font, size, and weight
                    }
                }
                .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
                .customBackButton()
                .environmentObject(appManager)

            return AnyView(view)
        case .language:
            // Navigate to Language View
            debugPrint("Language selected")
            return AnyView(underConstruction)
        case .notifications:
            // Navigate to Notifications View
            debugPrint("Notifications selected")
            return AnyView(underConstruction)
        case .aboutFoodApp:
            // Navigate to About Food App View
            debugPrint("About Food App selected")
            return AnyView(underConstruction)
        case .termsAndConditions:
            // Navigate to Terms and Conditions View
            debugPrint("Terms and Conditions selected")
            return AnyView(underConstruction)
        case .privacyPolicy:
            // Navigate to Privacy Policy View
            debugPrint("Privacy Policy selected")
            return AnyView(underConstruction)
        case .appTips:
            // Navigate to App Tips View
            debugPrint("App Tips selected")
            return AnyView(underConstruction)
        case .shareThisApp:
            // Share the app
            debugPrint("Share This App selected")
            return AnyView(underConstruction)
        case .delete:
            // Handle account deletion
            debugPrint("Delete Account selected")
            return AnyView(underConstruction)
        case .logout:
            // Handle logout
            debugPrint("Logout selected")
            
            let view = LogoutConfirmationPopup(onConfirm:{ value in
                // Handle logout logic
                print("\(value) Logged out successfully!")
                if value == true {
                    appManager.isUserLoggedIn = false
                }else{
                    debugPrint("dismiss view")
                }
            })
            
            return AnyView(view)
        }
    }
}

struct LogoutConfirmationPopup: View {
    
    var onConfirm: (Bool) -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Are you sure you want to log out?")
                .font(Theme.fonts.subhead)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 40) {
                Button(action: {
                    onConfirm(false)
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Text("Cancel")
                        .frame(minWidth: 60)
                        .padding()
                        .font(Theme.fonts.footnote)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    onConfirm(true)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Log Out")
                        .frame(minWidth:60)
                        .padding()
                        .font(Theme.fonts.footnoteMedium)
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .frame(width: 300, height: 150)
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
        .shadow(radius: 20)
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
        .customBackButton()
        .toolbar {
            ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                Text(Theme.localized.logout)
                    .font(Theme.fonts.headline) // Customize font, size, and weight
            }
        }
    }
}