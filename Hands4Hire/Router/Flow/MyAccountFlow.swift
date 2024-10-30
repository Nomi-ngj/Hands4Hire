//
//  MyAccountFlow.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 30/10/2024.
//

import Foundation
import SwiftUI

enum MyAccountFlow: Hashable, Codable, CaseIterable {
    case profile
    case notifications
    case settings
    case language
    case aboutFoodApp
    case termsAndConditions
    case privacyPolicy
    case appTips
    case shareThisApp
    case delete
    case logout
    
    var title:String {
        switch self {
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
    
    @ViewBuilder
    var view: some View {
        let underConstruction = UnderConstructionView()
            .navigationTitleWithBackButton(title)
        
        switch self {
        case .profile:
            if let user = Theme.sessionManager.userProfile {
                ProfileView(user: user)
                    .navigationTitleWithBackButton(title)
            }else{
                underConstruction
            }
        case .settings:
            SettingsView()
                .navigationTitleWithBackButton(title)
        case .language:
            LanguageSelectionView()
                .navigationTitleWithBackButton(title)
        case .notifications, .aboutFoodApp, .termsAndConditions, .privacyPolicy, .appTips, .shareThisApp, .delete:
            underConstruction
        case .logout:
            LogoutConfirmationPopup()
                .navigationTitleWithBackButton(title)
        }
    }
}
