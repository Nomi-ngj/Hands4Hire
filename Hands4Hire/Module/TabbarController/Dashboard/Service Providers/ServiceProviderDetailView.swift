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
    @EnvironmentObject var router: Router
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
                        Button(action:{
                            router.navigate(to: .reviews(serviceReviews: provider.reviews))
                        }) {
                            Text(localized: "(\(provider.reviews.count) reviews)")
                                .foregroundColor(appManager.theme.color.navyBlueTextColor)
                                .font(Theme.fonts.footnoteMedium)
                        }
                    }
                    
                    Text("Hourly Rate: $\(provider.hourlyRate, specifier: "%.2f")")
                        .font(Theme.fonts.footnote)
                    Text(localized:"Availability: \(provider.isAvailable ? "Available" : "Not Available")")
                        .font(Theme.fonts.footnote)
                        .foregroundColor(provider.isAvailable ? appManager.theme.color.primaryColor : appManager.theme.color.errorColor)
                 
                    Button {
                        //Booking Route
                        router.navigate(to: .createBooking(serviceProvider: self.provider))
                    } label: {
                        HStack {
                            Text("Book Now")
                                .font(Theme.fonts.subhead2)
                                .foregroundColor(appManager.theme.color.whiteColor)
                        }
                    }
                    .frame(width: 130, height: 40)
                    .buttonBorderShape(.roundedRectangle)
                    .background(appManager.theme.color.primaryColor)
                    .cornerRadius(12)
                }
                .padding(.horizontal, 8)
                
                Text(localized: "Services Offered:")
                    .font(Theme.fonts.headline)
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach(provider.services) { item in
                        ServiceProviderServiceItemView(item: item)
                            .environmentObject(appManager)
                    }
                }.padding(.horizontal)
            }
            Spacer()
        }
        .background(Color.gray.opacity(0.15))
    }
}
