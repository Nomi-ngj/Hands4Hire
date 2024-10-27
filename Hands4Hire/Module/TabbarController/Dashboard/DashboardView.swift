//
//  DashboardView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 15/10/2024.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var appManager: AppContainerManager
    
    var body: some View {
        ScrollView {
            SearchBarView()
                .padding(.vertical, 20)
            
            VStack(spacing: 20) {
                ForEach(HomeSection.allCases, id: \.self) { type in
                    
                    if type == .allServices {
                        ServiceVerticalSectionView(title: type.title, items: allServices, showSearchBar: false)
                    }else{
                        
                        let services = allServices.filter { $0.type == type }
                        ServiceSectionView(title: type.title, items: services)
                    }
                }
            }
        }
        .background(Color.gray.opacity(0.15))
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
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
