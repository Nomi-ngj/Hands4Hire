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
            Section(header: Text(localized: Theme.localized.appearance.localized()).font(Theme.fonts.caption3)) {
                Toggle(isOn: $appManager.isDarkMode) {
                    Text(localized: Theme.localized.darkMode.localized())
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
            }
            
            Section(header: Text(localized: Theme.localized.settings.localized()).font(Theme.fonts.caption3)) {
                Toggle(isOn: $viewModel.notificationsEnabled) {
                    Text(localized: Theme.localized.enableNotifications.localized())
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
                
                Toggle(isOn: $viewModel.faceIDEnabled) {
                    Text(localized: Theme.localized.enableFaceIDOrTouchID.localized())
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
                
                Button(action: {
                    router.navigate(to: .changePassword)
                }) {
                    Text(localized: Theme.localized.changePassword.localized())
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
            }
            
            Section(header: Text(localized: Theme.localized.support.localized()).font(Theme.fonts.caption3)) {
                
                Button(action: {
                    router.navigate(to: .contactUs)
                }) {
                    Text(localized: Theme.localized.contactUs.localized())
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
                
                Button(action: {
                    router.navigate(to: .fAQs)
                }) {
                    Text(localized: Theme.localized.fAQs.localized())
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.blackColor)
                }
            }
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
