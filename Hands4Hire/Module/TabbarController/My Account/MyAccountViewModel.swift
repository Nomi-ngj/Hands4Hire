//
//  MyAccountViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

class MyAccountViewModel: ObservableObject {
    @Published var user: User
    @Published var isLogout: Bool = false

    init(user: User) {
        self.user = user
        // Set primary color based on the initial color scheme
    }
    
    func updateUser(_ user: User) {
        self.user = user
    }
    
    func sectionTitle(for section: MyAccountSection) -> String {
        switch section {
        case .profile: return Theme.localized.profile.localized()
        case .settings: return Theme.localized.settings.localized()
        case .language: return Theme.localized.language.localized()
        case .notifications: return Theme.localized.notifications.localized()
        case .aboutFoodApp: return Theme.localized.aboutFoodApp.localized()
        case .termsAndConditions: return Theme.localized.termsAndConditions.localized()
        case .privacyPolicy: return Theme.localized.privacyPolicy.localized()
        case .appTips: return Theme.localized.appTips.localized()
        case .shareThisApp: return Theme.localized.shareThisApp.localized()
        case .delete: return Theme.localized.delete.localized()
        case .logout: return Theme.localized.logout.localized()
        }
    }
    
    func logout() {
        isLogout.toggle()
    }
}
