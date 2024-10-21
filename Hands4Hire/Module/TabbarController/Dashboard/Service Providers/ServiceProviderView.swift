//
//  ServiceProviderView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 19/10/2024.
//

import SwiftUI

struct ServiceProviderView: View {
    var provider: ServiceProvider // Accept the service provider as a parameter
    @EnvironmentObject var appManager: AppContainerManager
    var body: some View {
        NavigationLink(destination: ServiceProviderDetailView(provider: provider).environmentObject(appManager).navigationBarBackButtonHidden(true).customBackButton()) {
            VStack(spacing: 8){
                Image(provider.imageName) // Assuming ServiceProvider has an imageName property
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
//                    .cornerRadius(10)
                    .clipped()
//                    .elevationLevel1()

                Text(provider.name) // Assuming ServiceProvider has a name property
                    .font(Theme.fonts.caption3)
                    .foregroundColor(appManager.textPrimaryColor)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 40)
                    .padding(.horizontal)
                Text("⭐️ \(provider.rating, specifier: "%.1f")")
                    .font(Theme.fonts.caption4)
                    .foregroundColor(appManager.textPrimaryColor)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 25)
                    .padding(.horizontal)
                    
            }
            .background(appManager.grayBackgroundColor)    
            .cornerRadius(10)
            .preferredColorScheme(appManager.colorScheme)

        }
    }
}
