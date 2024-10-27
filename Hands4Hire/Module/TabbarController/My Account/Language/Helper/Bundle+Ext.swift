//
//  File.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/10/2024.
//

import Foundation

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
