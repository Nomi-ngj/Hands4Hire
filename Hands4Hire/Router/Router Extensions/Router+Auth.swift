//
//  Router+Auth.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 01/12/2024.
//

import SwiftUI
extension Router{
    
    @ViewBuilder
    func destination(for destination: AuthFlow) -> some View {
        switch destination {
        case .login:
            LoginView()
        case .createAccount:
            SignUpView(viewModel: .init())
        case .forgotPassword:
            UnderConstructionView()
                .navigationTitleWithBackButton(Theme.localized.forgotPasswordTitle.localized())
        }
    }
}
