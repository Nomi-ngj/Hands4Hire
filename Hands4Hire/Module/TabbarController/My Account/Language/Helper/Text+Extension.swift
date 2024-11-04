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

extension View {
    
    /// Creates a `TextField` with a localized placeholder.
    /// - Parameters:
    ///   - key: The localization key for the placeholder string.
    ///   - text: A binding to the text the user edits.
    func localizedTextField(_ key: String, text: Binding<String>) -> some View {
        let placeholder = Bundle.localizedString(forKey: key, value: nil, table: nil)
        return TextField(placeholder, text: text)
    }
    
    /// Creates a `SecureField` with a localized placeholder.
    /// - Parameters:
    ///   - key: The localization key for the placeholder string.
    ///   - text: A binding to the secure text the user edits.
    func localizedSecureField(_ key: String, text: Binding<String>) -> some View {
        let localizedPlaceholder = Text(Bundle.localizedString(forKey: key, value: nil, table: nil))
        return SecureField("", text: text, prompt: localizedPlaceholder)
    }
}

