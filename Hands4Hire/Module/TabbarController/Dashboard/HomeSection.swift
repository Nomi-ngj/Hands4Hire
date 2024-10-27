//
//  HomeSection.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import Foundation

enum HomeSection: String, CaseIterable, Hashable, Codable {
    case categories = "Categories"
    case cleaningServices = "Cleaning Services"
    case homeRepairs = "Home Repairs"
    case allServices = "All Services"
    
    var title: String {
        return self.rawValue
    }
}
