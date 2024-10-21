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

    var body: some View {
        Form {
            Section(header: Text("Change Password")) {
                SecureField("Current Password", text: $currentPassword)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmPassword)
            }
            
            Button(action: {
                // Handle change password action
                print("Change Password tapped")
            }) {
                Text("Change Password")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .customBackButton()
        .navigationTitle("Change Password")
    }
}

#Preview {
    ChangePasswordView()
}
