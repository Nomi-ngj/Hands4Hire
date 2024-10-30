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
    @EnvironmentObject var router: Router
    var body: some View {
        Form {
            Section(header: Text(localized: "Appearance").font(Theme.fonts.caption3)) {
                Toggle(isOn: $appManager.isDarkMode) {
                    Text(localized: "Dark Mode")
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
            }
            
            Section(header: Text(localized: "General").font(Theme.fonts.caption3)) {
                Toggle(isOn: $viewModel.notificationsEnabled) {
                    Text(localized: "Enable Notifications")
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
                
                Toggle(isOn: $viewModel.faceIDEnabled) {
                    Text(localized: "Enable Face ID / Touch ID")
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
                
                Button(action: {
                    router.navigate(to: .changePassword)
                }) {
                    Text(localized: "Change Password")
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
            }
            
            Section(header: Text(localized: "Support").font(Theme.fonts.caption3)) {
                
                Button(action: {
                    router.navigate(to: .contactUs)
                }) {
                    Text(localized: "Contact Us")
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
                
                Button(action: {
                    router.navigate(to: .fAQs)
                }) {
                    Text(localized: "FAQs")
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
            }
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
