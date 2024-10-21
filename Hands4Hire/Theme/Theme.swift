//
//  Theme.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import Foundation

struct Theme {
    
    /// The font configurations.
    static let fonts = Fonts()
    
    /// The localized constants.
    static let localized = LocalizedConstants()
//
//    /// The color theme.
    static let color = AppColor(rawValue: AppColor.current.rawValue)!
//
    /// The localized constants.
    static let images = AppImages()
//    /// The alert controller for displaying alerts.
//    static let alert = AlertController()
//    
//    /// The utility manager for various utility functions.
//    static let utility = UtilityManager.shared
//    
//    /// The session manager for managing user sessions.
    static let sessionManager = SessionManager()
}
