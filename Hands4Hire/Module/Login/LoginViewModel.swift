//
//  LoginViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var primaryColor: Color
    @Published var backgroundColor: Color
    @Published var shadowColor: Color
    
    init(colorScheme: ColorScheme) {
        // Initialize colors based on the provided color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.borderTintInputColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.blackColor : Theme.color.whiteColor
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.borderTintInputColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.blackColor : Theme.color.whiteColor
    }
}

