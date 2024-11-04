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
            
            AdvertisementBannersView(allServices: allServices)
            
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
    }
}

#Preview {
    DashboardView()
}

