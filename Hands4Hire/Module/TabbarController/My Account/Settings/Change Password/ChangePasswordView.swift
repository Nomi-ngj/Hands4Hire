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
        VStack{
            Form {
                Section(header: Text("Change Password").font(Theme.fonts.caption3)) {
                    SecureField("Current Password", text: $currentPassword)
                        .font(Theme.fonts.caption1)
                    SecureField("New Password", text: $newPassword)
                        .font(Theme.fonts.caption1)
                    SecureField("Confirm New Password", text: $confirmPassword)
                        .font(Theme.fonts.caption1)
                }
            }
            
            Spacer()
            
            Button(action: {
                // Handle change password action
                router.navigateBack()
            }) {
                Text("Change Password")
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
        
        .navigationTitleWithBackButton("Change Password")
    }
}

#Preview {
    ChangePasswordView()
}
