//
//  Color+Hex.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI
import UIKit

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 17), (int >> 4 & 0xF * 17), (int & 0xF * 17))
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16), (int >> 8 & 0xFF), (int & 0xFF))
        case 8: // ARGB (32-bit)
            (a, r, g, b) = ((int >> 24), (int >> 16 & 0xFF), (int >> 8 & 0xFF), (int & 0xFF))
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension UIColor {
    /// Converts UIColor to a hexadecimal string representation.
    /// - Returns: A hex string in the format `#RRGGBB`.
    func toHexString() -> String {
        guard let components = self.cgColor.components else { return "#000000" }
        
        // Extract RGB and Alpha components
        let red = Int(components[0] * 255.0)
        let green = Int(components[1] * 255.0)
        let blue = Int(components[2] * 255.0)
        
        // Format the hexadecimal string
        return String(format: "#%02X%02X%02X", red, green, blue)
    }
    
    var toColor: Color {
        return Color(hex: self.toHexString())
    }
}
