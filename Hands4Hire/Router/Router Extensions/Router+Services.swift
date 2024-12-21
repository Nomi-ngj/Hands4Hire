//
//  Router+Services.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 01/12/2024.
//

import SwiftUI

extension Router{
    
    @ViewBuilder
    func destination(for destination: ServicesFlow) -> some View {
        switch destination {
        case .service(let item):
            ServiceDetailView(item: item)
                .navigationTitleWithBackButton(item.title)
        case .services(let title, let items):
            ServiceVerticalSectionView(title: title, items: items)
                .background(Color.gray.opacity(0.15))
                .navigationTitleWithBackButton(title)
            
        case .serviceProvider(let serviceProviderItem):
            ServiceProviderDetailView(provider: serviceProviderItem)
                .navigationTitleWithBackButton(serviceProviderItem.name)
            
        case .reviews(let serviceReviews):
            ReviewListView(reviews: serviceReviews)
        }
    }
    
    func navigateBack(to target:ServicesFlow){
        guard !stackServicesFlow.isEmpty else { return }
        while let last = stackServicesFlow.last, last != target {
            navigateBack()
        }
    }
    
}
