//
//  SplashScreenViewTests.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 05/11/2024.
//


import XCTest
import Testing
import SwiftUI
@testable import Hands4Hire

@Suite("Splash Tests") struct SplashScreenViewTests {
    
    @Test func initialState() {
        // Arrange
        let viewModel = SplashScreenViewModel()
        
        // Assert initial values before animations
        #expect(viewModel.logoOpacity == 0.0, "Initial logo opacity should be 0")
        #expect(viewModel.taglineOpacity == 0.0, "Initial tagline opacity should be 0")
        #expect(viewModel.taglineOffset == 0.0, "Initial tagline offset should be 0")
    }
    
    @Test func startAnimations() {
        // Arrange
        let viewModel = SplashScreenViewModel()
        
        // Act
        viewModel.startAnimations()
        
        // Assert
        #expect(viewModel.logoOpacity == 1.0, "Logo opacity should be 1 after animation")
        #expect(viewModel.taglineOpacity == 1.0, "Tagline opacity should be 1 after animation")
        #expect(viewModel.taglineOffset == 0.0, "Tagline offset should be 0 after animation")
    }
    
    @Test func splashScreenView_TransitionAfterDelay() {
        // Arrange
        let expectation = XCTestExpectation(description: "Splash screen should be dismissed after delay")
//        let expectation = Expectation()
        var showSplash = true // Using a simple Bool instead of Binding for simplicity
        let appManager = AppContainerManager(isDarkMode: false, isUserLoggedIn: false)
        let viewModel = MockSplashScreenViewModel()
        
        // Create a Binding for showSplash
        let bindingShowSplash = Binding<Bool>(
            get: { showSplash },
            set: { newValue in
                showSplash = newValue
                if !newValue {
                    expectation.fulfill() // Fulfill the expectation when showSplash is set to false
                }
            }
        )
        
        // Act
        let _ = SplashScreenView(showSplash: bindingShowSplash, viewModel: viewModel)
            .environmentObject(appManager)
        
        // Assert initial states
        #expect(viewModel.logoOpacity == 0.0, "Logo opacity should initially be 0")
        #expect(viewModel.taglineOpacity == 0.0, "Tagline opacity should initially be 0")
        #expect(viewModel.taglineOffset == 0.0, "Tagline offset should initially be 0")
        
        // Start animations
        viewModel.startAnimations()
        
        // Check if animations have started
        #expect(viewModel.didStartAnimations, "Animation should start when `startAnimations` is called.")
        #expect(viewModel.logoOpacity == 1.0, "Logo opacity should be 1 after animation")
        #expect(viewModel.taglineOpacity == 1.0, "Tagline opacity should be 1 after animation")
        #expect(viewModel.taglineOffset == 0.0, "Tagline offset should be 0 after animation")
        
        // Wait for splash screen dismissal
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showSplash = false
            expectation.fulfill()
        }
    }
}
