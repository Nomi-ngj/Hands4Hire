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
            Section(header: Text("Appearance")) {
                Toggle(isOn: $appManager.isDarkMode) {
                    Text("Dark Mode")
                }
            }
            
            Section(header: Text("General")) {
                Toggle(isOn: $viewModel.notificationsEnabled) {
                    Text("Enable Notifications")
                }
                
                Toggle(isOn: $viewModel.faceIDEnabled) {
                    Text("Enable Face ID / Touch ID")
                }
                let changePasswordView = ChangePasswordView()
                    .environmentObject(appManager)
                NavigationLink(destination: changePasswordView) {
                    Text("Change Password")
                }
            }
            
            Section(header: Text("Support")) {
                NavigationLink(destination: ContactUsView()) {
                    Text("Contact Us")
                }
                
                NavigationLink(destination: FAQsView()) {
                    Text("FAQs")
                }
            }
        }
        .preferredColorScheme(appManager.colorScheme)
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}
