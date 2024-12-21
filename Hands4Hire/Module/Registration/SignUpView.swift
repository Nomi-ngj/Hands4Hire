//
//  RegistrationView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject private var viewModel: SignUpViewModel
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    init(viewModel: SignUpViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing:20) {
            
            // Username Field
            TextField(Theme.localized.username, text: $viewModel.username)
                .customTextFieldStyle(backgroundColor: appManager.theme.color.whiteColor, borderStrokeColor: appManager.theme.color.primaryColor)
            
            
            // Email Field
            TextField(Theme.localized.emailAddress, text: $viewModel.email)
                .customTextFieldStyle(backgroundColor: appManager.theme.color.whiteColor, borderStrokeColor: appManager.theme.color.primaryColor)
            
            // Password Field
            SecureField(Theme.localized.password, text: $viewModel.password)
                .customTextFieldStyle(backgroundColor: appManager.theme.color.whiteColor, borderStrokeColor: appManager.theme.color.primaryColor)
            
            // Confirm Password Field
            SecureField(Theme.localized.confirmPassword, text: $viewModel.confirmPassword)
                .customTextFieldStyle(backgroundColor: appManager.theme.color.whiteColor, borderStrokeColor: appManager.theme.color.primaryColor)
            
            Spacer()
            // Registration Button
            Button(action: {
                viewModel.callBackRegisterSuccessfully = {
                    router.navigateToRoot()
                    router.root = .dashboard
                }
                viewModel.registerUser()
            }) {
                Text(Theme.localized.signUp)
                
            }
            .buttonStyle(BorderedButtonStyle(borderColor: appManager.theme.color.primaryColor, foregroundColor: appManager.theme.color.whiteColor, backgroundColor: appManager.theme.color.primaryColor, font: Theme.fonts.subhead2))
            .disabled(viewModel.isSubmitting)
            
            // Error Message
            if let error = viewModel.registrationError {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .navigationTitleWithBackButton(Theme.localized.signUp.localized())
    }
}

