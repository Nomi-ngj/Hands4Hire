//
//  AppContainerManager.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import SwiftUI
import Combine

class AppContainerManager: ObservableObject {
    @Published var isDarkMode: Bool = true {
        didSet {
            self.updateColors(for: colorScheme)
        }
    }
    @Published var isUserLoggedIn: Bool = false // This allows modifying the state in the parent view
    
    @Published var primaryColor: Color = Theme.color.primaryColor
    @Published var secondaryColor: Color = Theme.color.secondaryColor
    @Published var textPrimaryColor: Color = Theme.color.textPrimaryColor
    @Published var textBlackColor: Color = Theme.color.blackColor
    @Published var textSecondaryColor: Color = Theme.color.textSecondaryColor
    @Published var whiteBackgroundColor: Color = Theme.color.whiteColor
    @Published var grayBackgroundColor: Color = Theme.color.disabledColor
    @Published var shadowColor: Color = Theme.color.primaryColor
    
    var colorScheme: ColorScheme {
        get {
            return isDarkMode ? .dark : .light
        }set {
            isDarkMode = newValue == .dark
        }
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        
        secondaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.secondaryColor
        textPrimaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.textPrimaryColor
        textBlackColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.blackColor
        textSecondaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.textSecondaryColor
        
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.borderTintInputColor
        self.whiteBackgroundColor = colorScheme == .dark ? Theme.color.appBackgroundColor : Theme.color.whiteColor
        self.grayBackgroundColor = colorScheme == .dark ? Theme.color.disabledColor : Theme.color.whiteColor
    }
}
