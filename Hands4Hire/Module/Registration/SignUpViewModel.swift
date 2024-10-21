//
//  SignUpViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var primaryColor: Color
    @Published var backgroundColor: Color
    
    @Published var username: String = "Nouman Gul Junejo"
    @Published var email: String = "Noumanguljunejo@gmail.com"
    @Published var password: String = "Test"
    @Published var confirmPassword: String = "Test"
    @Published var isSubmitting: Bool = false
    @Published var registrationError: String?
    @Binding var isTabBarActive:Bool
    
    var callBackRegisterSuccessfully: (() -> Void)?
    init(colorScheme: ColorScheme, isTabBarActive:Binding<Bool>) {
        // Initialize colors based on the provided color scheme
        _isTabBarActive = isTabBarActive
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.blackColor : Theme.color.whiteColor
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.blackColor : Theme.color.whiteColor
    }
    
    func registerUser() {
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            registrationError = "All fields are required."
            return
        }

        guard password == confirmPassword else {
            registrationError = "Passwords do not match."
            return
        }

        isSubmitting = true
        registrationError = nil

        // Simulate a network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self else { return }
            self.isSubmitting = false
            self.callBackRegisterSuccessfully?()
            Theme.sessionManager.userProfile = .init(username: self.username, email: self.email, profilePictureURL: "https://media.licdn.com/dms/image/D4D03AQG5cquTJk65ug/profile-displayphoto-shrink_800_800/0/1701194433108?e=1727308800&v=beta&t=YPuai8-9sBbnVqqhTEYtWGeRu35luh8NmnzNoot-Vn8", userType: .user)
            print("User registered with email: \(self.email)")
        }
    }
    

}
