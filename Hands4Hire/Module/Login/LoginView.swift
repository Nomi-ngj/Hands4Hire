//
//  LoginView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 08/09/2024.
//

import SwiftUI

enum UserType:Codable {
    case user
    case serviceProvider
    case agency
}

struct LoginView: View {
    
    @EnvironmentObject var appManager: AppContainerManager
    @Environment(\.colorScheme) private var userColorScheme
    @ObservedObject private var viewModel: LoginViewModel
    @State private var isTabBarActive = false
    @State private var isRegistered = false

    init() {
        viewModel = LoginViewModel(colorScheme: .light)
    }

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
                .foregroundColor(viewModel.primaryColor) // Adjust color as needed
            
            // Email and Password Fields
            VStack {
                TextField(Theme.localized.emailAddress, text: .constant(""))
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: viewModel.primaryColor)
                
                SecureField(Theme.localized.password, text: .constant(""))
                    .customTextFieldStyle(backgroundColor: Color.clear, borderStrokeColor: viewModel.primaryColor)
                
                HStack {
                    Spacer()
                    Button(action: {
                        // Forgot password action
                    }) {
                        Text(Theme.localized.forgotPassword)
                            .font(Theme.fonts.caption2)
                            .foregroundColor(viewModel.primaryColor)
                    }
                }
            }.padding(.bottom, 20)
            
            // Login and Register Buttons
            VStack {
                Button(action: {
                    // Login action
                    pushTabbar()
                }) {
                    Text(Theme.localized.login)
                }
                .buttonStyle(BorderedButtonStyle(borderColor: viewModel.primaryColor, foregroundColor: viewModel.backgroundColor, backgroundColor: viewModel.primaryColor, font: Theme.fonts.subhead2))
                
                Button(action: {
                    isRegistered = true
                }) {
                    Text(Theme.localized.signUp)
                }
                .buttonStyle(BorderedButtonStyle(borderColor: viewModel.primaryColor, foregroundColor: viewModel.primaryColor, backgroundColor: Color.clear, font: Theme.fonts.subhead2))
                
            }.padding(.bottom, 20)
            
            Text(Theme.localized.Or)
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
                        socialButtonWithIcon(filledColor: viewModel.backgroundColor, image: Theme.images.google)
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
                    socialButtonWithIcon(filledColor: Theme.color.disabledColor, image: Theme.images.apple)
                }
            }
            
            Spacer()
            
            // Skip Button
            Button(action: {
                // Skip action
                pushTabbar()
            }) {
                Text(Theme.localized.skipAndContinueAsaGuest)
                    .font(Theme.fonts.caption1)
                    .foregroundColor(viewModel.primaryColor)
            }
            
            Spacer()
            
            // NavigationLink SignUp
            NavigationLink(
                destination: SignUpView(viewModel: .init(colorScheme: appManager.colorScheme, isTabBarActive: $isTabBarActive)).environmentObject(appManager),
                isActive: $isRegistered,
                label: { EmptyView() }
            )
        }
        .padding()
        .onChange(of: appManager.isDarkMode) { newColorScheme in
            // Update ViewModel when the color scheme changes
            viewModel.updateColors(for: appManager.colorScheme)
        }
        .onChange(of: userColorScheme) { newColorScheme in
            appManager.isDarkMode = newColorScheme == .dark
        }
        .onAppear {
            // Update ViewModel when the view appears
            //viewModel.updateColors(for: appManager.colorScheme)
        }
        .background(Color.clear)
        .preferredColorScheme(appManager.colorScheme)

    }
    
    func pushTabbar(){
        appManager.isUserLoggedIn = true
    }
    
    @ViewBuilder
    func socialButtonWithIcon(filledColor:Color, image:Image) -> some View {
        ZStack {
            Rectangle()
                .fill(filledColor) // You can change the color as needed
                .frame(width: 50, height: 50) // Set the size of the rectangle
                .cornerRadius(15) // Set the corner radius
                .shadow(color: viewModel.shadowColor, radius: 2, x: 1, y: 2) // Add shadow with specified color, radius, and offset
            
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
