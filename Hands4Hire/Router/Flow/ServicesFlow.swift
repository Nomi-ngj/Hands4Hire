//
//  ServicesFlow.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 30/10/2024.
//

import Foundation

enum ServicesFlow: Hashable, Codable {
    case service(serviceItem: ServiceItem)
    case services(title: String, serviceItems: [ServiceItem])
    case serviceProvider(serviceProviderItem: ServiceProvider)
    case reviews(serviceReviews: [Review])
    
    enum CodingKeys: String, CodingKey {
        case type, serviceItem, title, serviceItems, serviceProviderItem,serviceReviews
    }
    
    enum CaseType: String, Codable {
        case single, multiple, provider, reviews
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(CaseType.self, forKey: .type)
        
        switch type {
        case .single:
            let item = try container.decode(ServiceItem.self, forKey: .serviceItem)
            self = .service(serviceItem: item)
        case .multiple:
            let title = try container.decode(String.self, forKey: .title)
            let items = try container.decode([ServiceItem].self, forKey: .serviceItems)
            self = .services(title: title, serviceItems: items)
        case .provider:
            let providerItem = try container.decode(ServiceProvider.self, forKey: .serviceProviderItem)
            self = .serviceProvider(serviceProviderItem: providerItem)
        case .reviews:
            let reviews = try container.decode([Review].self, forKey: .serviceReviews)
            self = .reviews(serviceReviews: reviews)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .service(let item):
            try container.encode(CaseType.single, forKey: .type)
            try container.encode(item, forKey: .serviceItem)
        case .services(let title, let items):
            try container.encode(CaseType.multiple, forKey: .type)
            try container.encode(title, forKey: .title)
            try container.encode(items, forKey: .serviceItems)
        case .serviceProvider(let serviceProviderItem):
            try container.encode(CaseType.provider, forKey: .type)
            try container.encode(serviceProviderItem, forKey: .serviceProviderItem)
        case .reviews(let serviceReviews):
            try container.encode(CaseType.reviews, forKey: .type)
            try container.encode(serviceReviews, forKey: .serviceReviews)
            
        }
    }
}
