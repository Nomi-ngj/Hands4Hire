//
//  DashboardView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 15/10/2024.
//

import SwiftUI



struct DashboardView: View {
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    var viewModel = DashboardViewModel(allServices: allServices)
    var body: some View {
        ScrollView {
            SearchBarView()
                .padding(.vertical, 20)
            
            AdvertisementBannersView(allServices: viewModel.allServices)
            
            VStack(spacing: 20) {
                ForEach(HomeSection.allCases, id: \.self) { type in
                    
                    if type == .allServices {
                        ServiceVerticalSectionView(title: type.title, items: viewModel.allServices, showSearchBar: false)
                    }else{
                        
                        let services = viewModel.services(type: type)
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

