//
//  DashboardView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 15/10/2024.
//

import SwiftUI

struct DashboardView: View {
    @State private var isNavigatingToServiceSection = false
    @State private var selectedServiceType: HomeSection = .allServices
    @State var serviceData: [ServiceItem] = []
    @EnvironmentObject var appManager: AppContainerManager
    @Environment(\.colorScheme) private var userColorScheme
    var body: some View {
        ScrollView {
            SearchBarView()
                .padding(.vertical, 20)
            
            VStack(spacing: 20) {
                ForEach(HomeSection.allCases, id: \.self) { type in
                    
                    if type == .allServices {
                        ServiceVerticalSectionView(section: type, items: allServices, onSeeAllTapped: {
                            // self.isNavigatingToServiceSection = true
                        }).environmentObject(appManager)
                    }else{
                        
                        let services = allServices.filter { $0.type == type }
                        ServiceSectionView(title: type.title, items: services, onSeeAllTapped: {
                            self.isNavigatingToServiceSection = true
                            self.serviceData = services
                            self.selectedServiceType = type
                        }, viewModel: .init(colorScheme: userColorScheme)).environmentObject(appManager)
                    }
                }
            }
        }
        .background(Color.gray.opacity(0.15))
        .onChange(of: appManager.isDarkMode) { newColorScheme in
            // Update ViewModel when the color scheme changes
            //viewModel.updateColors(for: appManager.colorScheme)
        }
        .onChange(of: userColorScheme) { newColorScheme in
            appManager.isDarkMode = newColorScheme == .dark
        }
        .preferredColorScheme(appManager.colorScheme)
        
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
        // NavigationLink to "All Services" view
        
        NavigationLink(destination: ServiceVerticalSectionView(section: self.selectedServiceType, items: self.serviceData).environmentObject(appManager).navigationTitle(self.selectedServiceType.title)
            .customBackButton(), isActive: $isNavigatingToServiceSection) {
                EmptyView()
            }
    }
}

#Preview {
    DashboardView()
}

struct AdvertisementView: View {
    let allServices: [ServiceItem]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(allServices) { service in
                    AdvertisementCard(service: service)
                }
            }
            .padding()
        }
    }
}

struct AdvertisementCard: View {
    let service: ServiceItem

    var body: some View {
        VStack {
            Image(service.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding()
            
            Text(service.title)
                .font(.headline)
                .padding()
            
//            Text(service.description) // Assuming you have a description property
//                .font(.subheadline)
//                .foregroundColor(.gray)
//                .padding()
            
            // Offer or promotion section
//            if let offer = service.offer {
//                Text("Offer: \(offer.title)")
//                    .font(.caption)
//                    .foregroundColor(.red)
//                    .padding(.bottom)
//            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
