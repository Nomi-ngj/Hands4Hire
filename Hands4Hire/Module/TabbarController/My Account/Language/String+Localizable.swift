//
//  String+Localizable.swift
//  Dawaa
//
//  Created by Nouman Gul on 15/02/2024.
//

import Foundation

/**
 Extension for localizing strings.
 */
extension String {
    
    /**
     Localizes the string using the specified bundle and table name.
     
     - Parameters:
        - bundle: The bundle containing the localization files. Default is `.main`.
        - tableName: The name of the localization table. Default is `"Localizable"`.
     
     - Returns: The localized string.
     */
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
