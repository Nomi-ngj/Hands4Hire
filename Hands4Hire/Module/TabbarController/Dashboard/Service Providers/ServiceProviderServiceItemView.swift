//
//  ServiceProviderServiceItemView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 19/10/2024.
//

import SwiftUI

struct ServiceProviderServiceItemView: View {
    
    @EnvironmentObject var appManager: AppContainerManager
//    @ObservedObject var viewModel: ServiceItemViewModel
    @Environment(\.colorScheme) private var userColorScheme
    var item: ServiceItem
    let itemWidth = UIScreen.main.bounds.width * 0.215
    
    var body: some View {
        VStack(spacing: 8) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.horizontal)
                .frame(height: 120)
                .cornerRadius(10)         // Ensure corner radius is applied before padding
                .clipped()                // Clip the image to the bounds of the corner radius
                .elevationLevel1()
            
            Text(localized: item.title)
                .font(Theme.fonts.caption2)
                .foregroundColor(appManager.theme.color.primaryColor)
                .multilineTextAlignment(.center) // Align text to center
                .lineLimit(nil)                  // Allow unlimited lines
                .frame(maxWidth: itemWidth)
                .frame(height: 48)
            
            Spacer()
                .frame(height: 0)
        }
        .frame(width: itemWidth)
        .padding(.horizontal)
        .background(appManager.theme.color.whiteColor)
        .cornerRadius(10)
    }
}
