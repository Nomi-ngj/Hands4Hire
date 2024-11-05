//
//  RouterTests.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 05/11/2024.
//

import SwiftUI
@testable import Hands4Hire
import Testing

@Suite("Router Tests") struct RouterTests {
    
    var sut: Router = .init()
    
    @Test func navigateToAuthFlow() {
        // Arrange
        let authDestination = AuthFlow.login // Replace with the actual initialization
       
        // Act
        sut.navigate(to: .login)

        // Assert
        #expect(sut.navPath.count == 1, "Navigation path should contain one item after navigation to AuthFlow")
        #expect(sut.containsDestination(authDestination), "Router should contain the AuthFlow.createAccount destination")
    }
    
    @Test func navigateToMyAccountFlow() {
        // Arrange
        let accountDestination = MyAccountFlow.profile // Replace with the actual initialization
        
        // Act
        sut.navigate(to: accountDestination)
        
        // Assert
        #expect(sut.navPath.count == 1, "Navigation path should contain one item after navigation to MyAccountFlow")
        #expect(sut.containsDestination(accountDestination), "Navigation path should contain the MyAccountFlow destination")
    }
    
    @Test func navigateToSettingsFlow() {
        // Arrange
        let settingsDestination = SettingsFlow.changePassword // Replace with the actual initialization
        
        // Act
        sut.navigate(to: settingsDestination)
        
        // Assert
        #expect(sut.navPath.count == 1, "Navigation path should contain one item after navigation to SettingsFlow")
        #expect(sut.containsDestination(settingsDestination), "Navigation path should contain the SettingsFlow destination")
    }
    
    @Test func navigateToTabBarFlow() {
        // Arrange
        let tabBarDestination = TabBarFlow.home // Replace with the actual initialization
        
        // Act
        sut.navigate(to: tabBarDestination)
        
        // Assert
        #expect(sut.navPath.count == 1, "Navigation path should contain one item after navigation to TabBarFlow")
        #expect(sut.containsDestination(tabBarDestination), "Navigation path should contain the TabBarFlow destination")
    }
    
    @Test func navigateToServicesFlow() {
        // Arrange
        let servicesDestination = ServicesFlow.service(serviceItem: allServices.first!) // Replace with the actual initialization
        
        // Act
        sut.navigate(to: servicesDestination)
        
        // Assert
        #expect(sut.navPath.count == 1, "Navigation path should contain one item after navigation to ServicesFlow")
        #expect(sut.containsDestination(servicesDestination), "Navigation path should contain the ServicesFlow destination")
    }
    
    @Test func navigateBack() {
        // Arrange
        let firstDestination = AuthFlow.login // Replace with actual initialization
        let secondDestination = MyAccountFlow.profile // Replace with actual initialization
        
        // Act
        sut.navigate(to: firstDestination)
        sut.navigate(to: secondDestination)
        sut.navigateBack()
        
        // Assert
        #expect(sut.navPath.count == 1, "Navigation path should contain one item after navigating back")
        #expect(sut.containsDestination(firstDestination), "Navigation path should contain the first destination after navigating back")
    }
    
    @Test func navigateToRoot() {
        // Arrange
        let firstDestination = AuthFlow.createAccount // Replace with actual initialization
        let secondDestination = MyAccountFlow.profile // Replace with actual initialization
        
        // Act
        sut.navigate(to: firstDestination)
        sut.navigate(to: secondDestination)
        sut.navigateToRoot()
        
        // Assert
        #expect(sut.navPath.count == 0, "Navigation path should be empty after navigating to root")
    }
}

