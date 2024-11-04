//
//  ChangePasswordView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 29/07/2024.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    var body: some View {
        let changePassword = Theme.localized.currentPassword.localized()
        VStack{
            VStack{
                
                self.localizedSecureField(Theme.localized.currentPassword.localized(), text: $currentPassword)
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
                
                
                self.localizedSecureField(Theme.localized.newPassword.localized(), text: $newPassword)
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
                
                self.localizedSecureField(Theme.localized.confirmNewPassword.localized(), text: $confirmPassword)
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                // Handle change password action
                router.navigateBack()
            }) {
                Text(localized:changePassword)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(appManager.theme.color.whiteColor)
                    .font(Theme.fonts.caption1)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
            Spacer()
        }
        .navigationTitleWithBackButton(changePassword)
    }
}

#Preview {
    ChangePasswordView()
}
