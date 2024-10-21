//
//  Fonts.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

/**
 The name of the font family used.
 */
fileprivate let familyName = "Poppins"

/**
 A struct for managing fonts used in the application.
 */
struct Fonts {
    /**
     Returns a UIFont object for a given font type and size.
     - Parameters:
     - type: The type of font.
     - size: The size of the font.
     - Returns: A UIFont object.
     */
    func getFont(type: AppFont, size: CGFloat) -> Font {
        return type.size(size)
    }
    
    func getFont(type: AppFont, size: FontSize) -> Font {
        return type.size(size.rawValue)
    }
    
    enum FontSize: CGFloat {
        case xxs = 10
        case xs = 12
        case small = 14
        case regular = 16
        case medium = 18
        case large = 20
        case xl = 24
        case xxl = 28
        case xxxl = 32
        case xxxxl = 36
    }
    /// Large title font.
    let largeTitle = AppFont.Regular.size(36)
    /// Title 1 font.
    let title1 = AppFont.Regular.size(30)
    /// Title 2 font.
    let title2 = AppFont.Regular.size(24)
    /// Title 3 font.
    let title3 = AppFont.Regular.size(22)
    /// Headline font.
    let headline = AppFont.Bold.size(19)
    /// Body font.
    let body = AppFont.Regular.size(19)
    /// Callout font.
    let callout = AppFont.Regular.size(18)
    /// Subhead font.
    let subhead = AppFont.Regular.size(17)
    let subhead2 = AppFont.Medium.size(16)
    /// Footnote font.
    let footnote = AppFont.Regular.size(15)
    /// Footnote medium font.
    let footnoteMedium = AppFont.Medium.size(15)
    /// Caption 1 font.
    let caption1 = AppFont.Regular.size(14)
    let caption1Med = AppFont.Medium.size(14)
    /// Caption 2 font.
    let caption2 = AppFont.Regular.size(13)
    let caption2Med = AppFont.Medium.size(13)
    /// Caption 3 font.
    let caption3 = AppFont.Medium.size(12)
    let caption3Reg = AppFont.Regular.size(12)
    let caption4 = AppFont.Medium.size(10)
    let caption5 = AppFont.Medium.size(8)
    /// Text field font.
    let textField = AppFont.Regular.size(16)
    /// Bold title font.
    let titleBold = AppFont.Bold.size(34)
    /// Medium title 2 font.
    let title2medium = AppFont.Medium.size(24)
    /// Medium title 3 font.
    let title3medium = AppFont.Medium.size(22)
    /// Medium callout font.
    let calloutMedium = AppFont.Medium.size(18)
    /// Gallery widget title font.
    let galleryWidgetTitle = AppFont.Bold.size(20)
    /// Semibold subheadline font.
    let subHeadlineSemibold = AppFont.Bold.size(17)
    /// Medium subheadline font.
    let subHeadlineMedium = AppFont.Medium.size(17)
    
    /**
     Enumeration for different font types.
     */
    enum AppFont: String {
        case Regular = "Regular"
        case Light = "Light"
        case Bold = "Bold"
        case Medium = "Medium"
        
        /**
         Returns a UIFont object for the given font type and size.
         - Parameters:
         - size: The size of the font.
         - Returns: A UIFont object.
         */
        func size(_ size: CGFloat) -> Font {
            
            return Font.custom(fullFontName, size: size)
            
        }
        
        /**
         The full name of the font, including family and type.
         */
        fileprivate var fullFontName: String {
            return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
        }
    }
}
