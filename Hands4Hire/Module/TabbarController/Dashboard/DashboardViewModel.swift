//
//  DashboardViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//

import Foundation

class DashboardViewModel {
    var allServices:[ServiceItem]
    
    init(allServices: [ServiceItem]) {
        self.allServices = allServices
    }
    
    func services(type: HomeSection) -> [ServiceItem]{
        return allServices.filter({$0.type == type})
    }
}
