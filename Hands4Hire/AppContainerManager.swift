//
//  AppContainerManager.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import SwiftUI
import Combine

class AppContainerManager: ObservableObject {
    
    @Published var isDarkMode: Bool {
        didSet {
            theme.setTheme(self.isDarkMode ? .darkMode:.default)
            Theme.sessionManager.isDarkModeEnabled = isDarkMode
        }
    }
    @ObservedObject var theme = Theme()
    @ObservedObject var router = Router()
    @Published var isUserLoggedIn: Bool = false // This allows modifying the state in the parent view
    
    init(isDarkMode: Bool, isUserLoggedIn: Bool) {
        self.isDarkMode = isDarkMode
        self.isUserLoggedIn = isUserLoggedIn
        theme.setTheme(isDarkMode ? .darkMode:.default)
    }
    
    var colorScheme: ColorScheme {
        get {
            return isDarkMode ? .dark : .light
        }
    }
}
