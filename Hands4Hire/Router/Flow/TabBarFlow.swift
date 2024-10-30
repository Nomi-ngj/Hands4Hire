//
//  TabBarFlow.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 30/10/2024.
//

import Foundation
import SwiftUI

enum TabBarFlow: Hashable, Codable, CaseIterable {
    case home
    case orders
    case favorites
    case profile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            DashboardView()
                .navigationTitle(Theme.localized.appName)
        case .orders:
            ServicesListView()
        case .favorites:
            UsersListView()
        case .profile:
            MyAccountView()
        }
    }
    
    var title:String {
        switch self {
        case .home:
            return Theme.localized.home.localized()
        case .orders:
            return Theme.localized.myOrders.localized()
        case .favorites:
            return Theme.localized.myFavorites.localized()
        case .profile:
            return Theme.localized.myAccount.localized()
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
