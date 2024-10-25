//
//  LocalizationManager.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 25/10/2024.
//


import Foundation

/// Key for storing Apple language.
let APPLE_LANGUAGE_KEY = "AppleLanguages"

class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()
    
    @Published var selectedLanguage: AppLanguage = .english {
        didSet {
            UserDefaults.standard.set(selectedLanguage.rawValue, forKey: APPLE_LANGUAGE_KEY)
            Bundle.setLanguage(selectedLanguage.rawValue)
        }
    }
    
    private init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: APPLE_LANGUAGE_KEY),
           let language = AppLanguage(rawValue: savedLanguage) {
            selectedLanguage = language
            Bundle.setLanguage(savedLanguage)
        }
    }
}

extension Bundle {
    private static var bundle: Bundle?

    static func setLanguage(_ language: String) {
        // Use the language code to find the correct .lproj directory
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            return
        }
        DispatchQueue.main.async {
            self.bundle = Bundle(path: path)
        }
    }

    static func localizedString(forKey key: String, value: String?, table: String? = nil) -> String {
        // Attempt to fetch the localized string from the custom bundle
        return bundle?.localizedString(forKey: key, value: value, table: table) ?? key
    }
}
