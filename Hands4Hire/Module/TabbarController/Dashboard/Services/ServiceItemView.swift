//
//  ServiceItemView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

class ServiceItemViewModel: ObservableObject {
    @Published var primaryColor: Color
    @Published var backgroundColor: Color
    @Published var shadowColor: Color
    
    init(colorScheme: ColorScheme) {
        // Initialize colors based on the provided color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.borderTintInputColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.textSecondaryColor : Theme.color.whiteColor
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.borderTintInputColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.textSecondaryColor : Theme.color.whiteColor
    }
}

struct ServiceItemView: View {
    
    @EnvironmentObject var appManager: AppContainerManager
    @ObservedObject var viewModel: ServiceItemViewModel
    @Environment(\.colorScheme) private var userColorScheme
    var item: ServiceItem
    let itemWidth = UIScreen.main.bounds.width * 0.215
    
    var body: some View {
        NavigationLink(destination: ServiceDetailView(item: item).environmentObject(appManager).navigationBarBackButtonHidden(true).customBackButton()) {
            VStack(spacing: 8) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal)
                    .frame(height: 120)
                    .cornerRadius(10)         // Ensure corner radius is applied before padding
                    .clipped()                // Clip the image to the bounds of the corner radius
                    .elevationLevel1()
                
                Text(item.title)
                    .font(Theme.fonts.caption2)
                    .foregroundColor(viewModel.primaryColor)
                    .multilineTextAlignment(.center) // Align text to center
                    .lineLimit(nil)                  // Allow unlimited lines
                    .frame(maxWidth: itemWidth)
                    .frame(height: 48)
                
                Spacer()
                    .frame(height: 0)
            }
            .frame(width: itemWidth)
            .padding(.horizontal)
            .background(viewModel.backgroundColor)
            .cornerRadius(10)
            .onChange(of: appManager.isDarkMode) { newColorScheme in
                viewModel.updateColors(for: appManager.colorScheme)
            }
            .onChange(of: userColorScheme) { newColorScheme in
                appManager.isDarkMode = newColorScheme == .dark
            }
            .onAppear {
                viewModel.updateColors(for: appManager.colorScheme)
            }
            .preferredColorScheme(appManager.colorScheme)
        }
    }
}











