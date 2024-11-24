//
//  Router.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/10/2024.
//

import SwiftUI

final class Router: ObservableObject {
    @Published var navPath = NavigationPath()
    private var destinations: [AnyHashable] = []

    func navigate(to destination: AuthFlow) {
        destinations.append(destination)
        navPath.append(destination)
    }
    
    func navigate(to destination: MyAccountFlow) {
        destinations.append(destination)
        navPath.append(destination)
    }
    
    func navigate(to destination: SettingsFlow) {
        destinations.append(destination)
        navPath.append(destination)
    }
    
    func navigate(to destination: BookingFlow) {
        destinations.append(destination)
        navPath.append(destination)
    }
    func navigate(to destination: TabBarFlow) {
        destinations.append(destination)
        navPath.append(destination)
    }
    
    func navigate(to destination: ServicesFlow) {
        destinations.append(destination)
        navPath.append(destination)
    }
    
    func navigateBack() {
        if !destinations.isEmpty {
            destinations.removeLast()
        }
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        destinations.removeAll()
        navPath.removeLast(navPath.count)
    }
    
    func containsDestination<T: Hashable>(_ destination: T) -> Bool {
        return destinations.contains(where: { $0 == destination as AnyHashable })
    }
}


