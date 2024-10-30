//
//  SettingsFlow.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 30/10/2024.
//


import Foundation
import SwiftUI

enum SettingsFlow: Hashable, Codable {
    case changePassword
    case contactUs
    case fAQs
     
    @ViewBuilder
    var view: some View {
        switch self {
        case .changePassword:
            ChangePasswordView()
        case .contactUs:
            ContactUsView()
        case .fAQs:
            FAQsView()
        }
    }
}
