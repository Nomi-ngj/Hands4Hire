//
//  TabViewType.swift
//
//
//  Created by Nouman Gul Junejo on 02/08/2023.
//

import Foundation


enum TabViewType: CaseIterable {
    case home
    case orders
    case favorites
    case profile
    
    var title:String {
        switch self {
        case .home:
            return Theme.localized.home
        case .orders:
            return Theme.localized.myOrders
        case .favorites:
            return Theme.localized.myFavorites
        case .profile:
            return Theme.localized.myAccount
        }
    }
    
    var imageNameActive:String{
        switch self {
        case .home:
            return "home"
        case .orders:
            return "orders"
        case .favorites:
            return "favorite"
        case .profile:
            return "profile"
        }
    }
    
    var imageNameInactive:String{
        switch self {
        case .home:
            return "home"
        case .orders:
            return "orders"
        case .favorites:
            return "favorite"
        case .profile:
            return "profile"
        }
    }
}
