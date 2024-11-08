//
//  AppColor.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI
import UIKit
/**
 Extension for defining custom notification names.
 */
extension Notification.Name {
    /// Notification name for theme change.
    static let themeChanged = Notification.Name("themeChanged")
    /// Notification name for updating home.
}

/**
 Enumeration for different color themes.
 */

enum AppColor:Int{
    case `default`, darkMode, blue, green
    
    private enum Keys {
        static let selectedTheme = "SelectedTheme"
    }
    
    static var current: AppColor {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return AppColor(rawValue: storedTheme) ?? .default
    }
    
    func apply() {
        
        UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
        UserDefaults.standard.synchronize()
        DispatchQueue.main.async {
            UIApplication.shared.delegate?.window??.tintColor = UIColor(resource: .appPrimary)
        }
        NotificationCenter.default.post(name: .themeChanged, object: nil)
    }
    
    var primaryColor: Color {
        return primaryUIColor.toColor
    }
    
    // New computed property for UIColor
    var primaryUIColor: UIColor {
        switch self {
        case .default:
            return UIColor(resource: .appPrimary)
        case .darkMode:
            return UIColor(resource: .appSecondary)
        case .blue:
            return UIColor(resource: .appPrimary)
        case .green:
            return UIColor(resource: .appPrimary)
        }
    }
    
    var secondaryColor: Color { return UIColor(resource: .appSecondary).toColor }
    var tealColor: Color { return UIColor(resource: .appTeal).toColor }
    var textPrimaryColor: Color { return UIColor(resource: .appTextPrimary).toColor }
    var textSecondaryColor: Color { return UIColor(resource: .appTextSecondary).toColor }
    var appBackgroundColor: Color { return UIColor(resource: .appBackground).toColor }
    var textTertiaryColor: Color { return UIColor(resource: .appTextTertiary).toColor }
    var placeholderTextColor: Color { return UIColor(resource: .appPlaceholderText).toColor }
    var navyBlueTextColor: Color { return UIColor(resource: .appNavyBlue).toColor }
    var blackColor: Color {
        switch self {
        case .default:
            return UIColor(resource: .appBlack).toColor
        case .darkMode:
            return UIColor(resource: .appWhite).toColor
        case .blue:
            return UIColor(resource: .appBlack).toColor
        case .green:
            return UIColor(resource: .appBlack).toColor
        }
        
    }
    var whiteColor: Color {
        return whiteUIColor.toColor
    }
    
    var whiteUIColor: UIColor {
        switch self {
        case .default:
            return UIColor(resource: .appWhite)
        case .darkMode:
            return UIColor(resource: .appBlack)
        case .blue:
            return UIColor(resource: .appWhite)
        case .green:
            return UIColor(resource: .appWhite)
        }
        
    }
    var placeholderBgColor: Color { return UIColor(resource: .appPlaceholderBg).toColor }
    var borderTintInputColor: Color { return UIColor(resource: .appBorderTintInput).toColor }
    var disabledColor: Color { return UIColor(resource: .appDisabled).toColor }
    var successColor: Color { return UIColor(resource: .appSuccess).toColor }
    var warningColor: Color { return UIColor(resource: .appWarning).toColor }
    var infoColor: Color { return UIColor(resource: .appInfo).toColor }
    var errorColor: Color { return UIColor(resource: .appError).toColor }
    var cleared: Color { return UIColor.clear.toColor }
    
    
    
    var textBlackColor: Color { return UIColor(resource: .appSecondary).toColor }
    var whiteBackgroundColor: Color { return UIColor(resource: .appSecondary).toColor }
    var grayBackgroundColor: Color { return UIColor(resource: .appSecondary).toColor }
    var shadowColor: Color { return UIColor(resource: .appSecondary).toColor }
    
    func hexStringToColor (_ hex:String) -> Color{
        return Color.init(hex: hex)
    }
}


