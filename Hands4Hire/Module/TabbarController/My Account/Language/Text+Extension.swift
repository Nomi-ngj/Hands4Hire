//
//  Text+Extension.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 25/10/2024.
//


import SwiftUI


extension Text {
    /// Creates a `Text` view with the localized string for the provided key.
    /// - Parameter key: The localization key for the desired string.
    init(localized key: String) {
        // Fetch localized string using the custom Bundle method
        let localizedString = Bundle.localizedString(forKey: key, value: nil, table: nil)
        self.init(localizedString)
    }
}
