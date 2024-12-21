//
//  LoginView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 08/09/2024.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appManager: AppContainerManager
    @State private var isTabBarActive = false
    @State private var isRegistered = false
    @EnvironmentObject var router: Router
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            // Logo
            Theme.images.appLogo // Replace with your logo image name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100) // Adjust size as needed
            
            Text(localized: Theme.localized.welcome.localized())
                .font(Theme.fonts.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(appManager.theme.color.primaryColor) // Adjust color as needed
            
            // Email and Password Fields
            VStack {
                self.localizedTextField(Theme.localized.emailAddress.localized(), text: $username)
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
                
                
                self.localizedSecureField(Theme.localized.password.localized(), text: $password)
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
//                let key = Theme.localized.emailAddress.localized()
//                TextField(key, text: $username)
//                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
////                
//                SecureField(Theme.localized.password.localized(), text: .constant(""))
//                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: appManager.theme.color.primaryColor)
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Forgot password action
                        router.navigate(to: .forgotPassword)
                    }) {
                        Text(Theme.localized.forgotPassword.localized())
                            .font(Theme.fonts.caption2)
                            .foregroundColor(appManager.theme.color.primaryColor)
                    }
                }
            }.padding(.bottom, 20)
            
            // Login and Register Buttons
            VStack {
                Button(action: {
                    // Login action
                    pushTabbar()
                }) {
                    Text(localized: Theme.localized.login.localized())
                }
                .buttonStyle(BorderedButtonStyle(borderColor: appManager.theme.color.primaryColor, foregroundColor: appManager.theme.color.whiteColor, backgroundColor: appManager.theme.color.primaryColor, font: Theme.fonts.subhead2))
                
                Button(action: {
                    router.navigate(to: .createAccount)
//                    isRegistered = true
                }) {
                    Text(localized: Theme.localized.signUp.localized())
                }
                .buttonStyle(BorderedButtonStyle(borderColor: appManager.theme.color.primaryColor, foregroundColor: appManager.theme.color.primaryColor, backgroundColor: appManager.theme.color.whiteColor, font: Theme.fonts.subhead2))
                
            }.padding(.bottom, 20)
            
            Text(localized: Theme.localized.Or.localized())
                .font(Theme.fonts.caption1)
                .foregroundColor(Color.gray)
                .padding(.vertical, 20)
            
            // Social Login Buttons
            HStack(spacing: 30) {
                Button(action: {
                    // Google login action
                    pushTabbar()
                }) {
                    ZStack {
                        socialButtonWithIcon(filledColor: appManager.theme.color.whiteColor, image: Theme.images.google)
                    }
                }
                
                Button(action: {
                    // Facebook login action
                    pushTabbar()
                }) {
                    socialButtonWithIcon(filledColor: Color(hex: "#1877F2"), image: Theme.images.facebook)
                }
                
                Button(action: {
                    // Apple login action
                    pushTabbar()
                }) {
                    socialButtonWithIcon(filledColor: appManager.theme.color.disabledColor, image: Theme.images.apple)
                }
            }
            
            Spacer()
            
            // Skip Button
            Button(action: {
                // Skip action
                pushTabbar()
            }) {
                Text(localized: Theme.localized.skipAndContinueAsaGuest.localized())
                    .font(Theme.fonts.caption1)
                    .foregroundColor(appManager.theme.color.primaryColor)
            }
            
            Spacer()
        }
        .padding()
        .background(appManager.theme.color.whiteColor)
    }
    
    func pushTabbar(){
        router.navigateToRoot()
        router.root = .dashboard
    }
    
    @ViewBuilder
    func socialButtonWithIcon(filledColor:Color, image:Image) -> some View {
        ZStack {
            Rectangle()
                .fill(filledColor) // You can change the color as needed
                .frame(width: 50, height: 50) // Set the size of the rectangle
                .cornerRadius(15) // Set the corner radius
                .shadow(color: appManager.theme.color.shadowColor, radius: 2, x: 1, y: 2) // Add shadow with specified color, radius, and offset
            
            image
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
        }
    }
}


#Preview {
    LoginView()
}
