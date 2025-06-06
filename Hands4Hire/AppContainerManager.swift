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
    @Published var isLoading: Bool = false
    
    init(isDarkMode: Bool, isUserLoggedIn: Bool) {
        self.isDarkMode = isDarkMode
        theme.setTheme(isDarkMode ? .darkMode:.default)
    }
    
    var colorScheme: ColorScheme {
        get {
            return isDarkMode ? .dark : .light
        }
    }
}
