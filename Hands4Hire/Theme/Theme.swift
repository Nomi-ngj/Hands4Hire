//
//  Theme.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import Foundation

class Theme : ObservableObject {
    
    static let shared = Theme()
    
    /// The font configurations.
    static let fonts = Fonts()
        
    /// The localized constants.
    static let localized = LocalizedConstants()

    @Published var color:AppColor = AppColor.current
    
    func setTheme(_ color: AppColor) {
        self.color = color
        self.color.apply()
    }
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
