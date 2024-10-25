//
//  ServiceProviderDetailView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 19/10/2024.
//

import SwiftUI

struct ServiceProviderDetailView: View {
    var provider: ServiceProvider // Accept the service provider as a parameter
    @EnvironmentObject var appManager: AppContainerManager
    @Environment(\.colorScheme) private var userColorScheme
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                
                Image(provider.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .elevationLevel1()
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        (Text(localized: "Rating: ")
                            .font(Theme.fonts.footnoteMedium) +
                         Text("\(provider.rating, specifier: "%.1f")")
                            .font(Theme.fonts.footnote))
                        NavigationLink(destination: ReviewListView(reviews: provider.reviews).environmentObject(appManager).navigationBarBackButtonHidden(true).customBackButton()) {
                            Text(localized: "(\(provider.reviews.count) reviews)")
                                .foregroundColor(Theme.color.navyBlueTextColor)
                                .font(Theme.fonts.footnoteMedium)
                        }
                    }
                    
                    Text("Hourly Rate: $\(provider.hourlyRate, specifier: "%.2f")")
                        .font(Theme.fonts.footnote)
                    Text(localized:"Availability: \(provider.isAvailable ? "Available" : "Not Available")")
                        .font(Theme.fonts.footnote)
                        .foregroundColor(provider.isAvailable ? Theme.color.primaryColor : Theme.color.errorColor)
                }
                .padding(.horizontal, 8)
                
                Text(localized: "Services Offered:")
                    .font(Theme.fonts.headline)
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach(provider.services) { item in
                        ServiceProviderServiceItemView(viewModel: .init(colorScheme: userColorScheme), item: item)
                            .environmentObject(appManager)
                    }
                }.padding(.horizontal)
            }
            Spacer()
        }
        .background(Color.gray.opacity(0.15))
        .toolbar {
            ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                Text(localized: provider.name)
                    .font(Theme.fonts.headline) // Customize font, size, and weight
            }
        }
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}
