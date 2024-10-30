//
//  Router.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/10/2024.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: AuthFlow) {
        navPath.append(destination)
    }
    
    func navigate(to destination: MyAccountFlow) {
        navPath.append(destination)
    }
    
    func navigate(to destination: SettingsFlow) {
        navPath.append(destination)
    }
    
    func navigate(to destination: TabBarFlow) {
        navPath.append(destination)
    }
    
    func navigate(to destination: ServicesFlow) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}


