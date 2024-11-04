//
//  AdvertisementBannerCard.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 05/11/2024.
//

import SwiftUI

struct AdvertisementBannerCard: View {
    let service: ServiceItem
    @EnvironmentObject var appManager: AppContainerManager
    var body: some View {
        ZStack {
            Image(service.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 370, height: 200)
                .clipped()

            // Overlay the title in the middle
            Text(localized: service.title.localized()) // Ensure that service.title is defined in ServiceItem
                .font(.headline)
                .foregroundColor(appManager.theme.color.whiteColor) // Adjust color as needed
                .padding()
                .background(appManager.theme.color.blackColor.opacity(0.5)) // Optional: Background for better readability
                .cornerRadius(5)
                .padding(14)
        }
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

