//
//  MyAccountViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

class MyAccountViewModel: ObservableObject {
    @Published var primaryColor: Color
    @Published var user: User
    @Published var isLogout: Bool = false

    init(user: User, colorScheme: ColorScheme) {
        self.user = user
        // Set primary color based on the initial color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
    }
    
    func updateColorScheme(_ colorScheme: ColorScheme) {
        primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
    }
    
    func updateUser(_ user: User, with colorScheme: ColorScheme) {
        self.user = user
        updateColorScheme(colorScheme)
    }
    
    func sectionTitle(for section: MyAccountSection) -> String {
        switch section {
        case .profile: return Theme.localized.profile
        case .settings: return Theme.localized.settings
        case .language: return Theme.localized.language
        case .notifications: return Theme.localized.notifications
        case .aboutFoodApp: return Theme.localized.aboutFoodApp
        case .termsAndConditions: return Theme.localized.termsAndConditions
        case .privacyPolicy: return Theme.localized.privacyPolicy
        case .appTips: return Theme.localized.appTips
        case .shareThisApp: return Theme.localized.shareThisApp
        case .delete: return Theme.localized.delete
        case .logout: return Theme.localized.logout
        }
    }
    
    func logout() {
        isLogout.toggle()
    }
}
