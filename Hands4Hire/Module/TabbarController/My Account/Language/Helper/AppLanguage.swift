//
//  AppLanguage.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 25/10/2024.
//

import Foundation

enum AppLanguage: String, CaseIterable, Identifiable {
    case english = "en"
    case french = "fr"
    case spanish = "es"
    case arabic = "ar"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        switch self {
        case .english: return "English"
        case .french: return "Français"
        case .spanish: return "Español"
        case .arabic: return "العربية"
        }
    }
}
