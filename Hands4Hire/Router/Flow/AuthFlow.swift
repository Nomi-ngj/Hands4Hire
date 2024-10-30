//
//  AuthFlow.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 30/10/2024.
//

import Foundation
import SwiftUI

enum AuthFlow: Hashable, Codable {
    case login
    case createAccount
    case forgotPassword
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
        case .createAccount:
            SignUpView(viewModel: .init())
        case .forgotPassword:
            UnderConstructionView()
                .navigationTitleWithBackButton("Forgot Password")
        }
    }
}
