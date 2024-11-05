//
//  Hands4HireTests.swift
//  Hands4HireTests
//
//  Created by Nouman Gul Junejo on 05/11/2024.
//

import Testing
@testable import Hands4Hire

@Suite("Hands4Hire Tests") struct Hands4HireTests {
    
    @Suite("AppContainerManager Tests") struct AppContainerManagerInitialState {
        
        @Test func userLoggedInState() async throws {
            // Test if the user login state is correctly initialized to true
            let sut = await AppContainerManager(isDarkMode: false, isUserLoggedIn: true)
            
            // Access the user login state from the MainActor
            let isLoggedIn = await MainActor.run {
                sut.isUserLoggedIn
            }
            
            #expect(isLoggedIn == true, "User should be marked as logged in")
        }
        
        @Test func userNotLoggedInState() async throws {
            // Test if the user login state is correctly initialized to false
            let sut = await AppContainerManager(isDarkMode: false, isUserLoggedIn: false)
            
            // Access the user login state from the MainActor
            let isLoggedIn = await MainActor.run {
                sut.isUserLoggedIn
            }
            
            #expect(isLoggedIn == false, "User should not be marked as logged in")
        }

        @Test func darkModeStateEnabled() async throws {
            // Test if dark mode is correctly initialized to true
            let sut = await AppContainerManager(isDarkMode: true, isUserLoggedIn: false)

            // Access the dark mode state from the MainActor
            let isDarkModeEnabled = await MainActor.run {
                sut.isDarkMode
            }

            #expect(isDarkModeEnabled == true, "Dark mode should be enabled")
        }

        @Test func darkModeStateDisabled() async throws {
            // Test if dark mode is correctly initialized to false
            let sut = await AppContainerManager(isDarkMode: false, isUserLoggedIn: false)

            // Access the dark mode state from the MainActor
            let isDarkModeEnabled = await MainActor.run {
                sut.isDarkMode
            }

            #expect(isDarkModeEnabled == false, "Dark mode should be disabled")
        }
    }
    
    @Suite("NavigationPath Tests") struct NavigationPathInitialState {
        
        @Test func navigationPathSetup() async throws {
            // Verify that NavigationPath is set up correctly in NavigationStack
            let sut = Router()
            let initialPath = sut.navPath
            
            #expect(initialPath.isEmpty, "Navigation path should initially be empty")
        }
    }
}



