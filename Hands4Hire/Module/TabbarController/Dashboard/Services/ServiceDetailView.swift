//
//  ServiceDetailView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 19/10/2024.
//

import SwiftUI

struct ServiceDetailView: View {
    var item: ServiceItem // Accept the service item as a parameter
    var serviceProviders: [ServiceProvider] = ServiceProvider.serviceProviders
    @EnvironmentObject var appManager: AppContainerManager
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Description: ").font(Theme.fonts.caption1Med)
                    Text(item.description).font(Theme.fonts.caption2)
                    Text("Overview: ").font(Theme.fonts.caption1Med)
                    Text(item.overview).font(Theme.fonts.caption2)
                    Text("Expected Duration: ").font(Theme.fonts.caption1Med)
                    Text(item.expectedDuration).font(Theme.fonts.caption2)
                    Text("Cost Range: ").font(Theme.fonts.caption1Med)
                    Text(item.costRange).font(Theme.fonts.caption2)
                }
                .padding(.horizontal, 8)
                
                Text("Service Providers")
                    .font(Theme.fonts.headline)
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(serviceProviders) { provider in
                        ServiceProviderView(provider: provider).environmentObject(appManager)
                            .cornerRadius(10)
                            .elevationLevel1()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
//        .navigationTitle(item.title) // Set the navigation title
        .toolbar {
            ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                Text(item.title)
                    .font(Theme.fonts.headline) // Customize font, size, and weight
            }
        }
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}