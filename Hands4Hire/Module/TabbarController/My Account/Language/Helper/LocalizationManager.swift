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
            NotificationCenter.default.post(name: .languageDidChange, object: nil)

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

extension Notification.Name {
    static let languageDidChange = Notification.Name("languageDidChange")
}

