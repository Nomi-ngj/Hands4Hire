//
//  SettingsView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 28/07/2024.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @ObservedObject private var viewModel = SettingsViewModel()
    
    @EnvironmentObject var appManager: AppContainerManager

    var body: some View {
        Form {
            Section(header: Text(localized: "Appearance")) {
                Toggle(isOn: $appManager.isDarkMode) {
                    Text(localized: "Dark Mode")
                }
            }
            
            Section(header: Text(localized: "General")) {
                Toggle(isOn: $viewModel.notificationsEnabled) {
                    Text(localized: "Enable Notifications")
                }
                
                Toggle(isOn: $viewModel.faceIDEnabled) {
                    Text(localized: "Enable Face ID / Touch ID")
                }
                let changePasswordView = ChangePasswordView()
                    .environmentObject(appManager)
                NavigationLink(destination: changePasswordView) {
                    Text(localized: "Change Password")
                }
            }
            
            Section(header: Text(localized: "Support")) {
                NavigationLink(destination: ContactUsView()) {
                    Text(localized: "Contact Us")
                }
                
                NavigationLink(destination: FAQsView()) {
                    Text(localized: "FAQs")
                }
            }
        }
        .preferredColorScheme(appManager.colorScheme)
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}
