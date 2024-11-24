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
    case booking
    case favorites
    case profile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            DashboardView()
                .navigationTitle(Theme.localized.appName)
        case .booking:
            BookingView(viewModel: .init())
        case .favorites:
            UsersListView()
        case .profile:
            MyAccountView()
                .navigationTitle(title.localized())
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return Theme.localized.home.localized()
        case .booking:
            return Theme.localized.booking.localized()
        case .favorites:
            return Theme.localized.myFavorites.localized()
        case .profile:
            return Theme.localized.myAccount
        }
    }
    
    var imageActive: Image {
        switch self {
        case .home:
            return Theme.images.home
        case .booking:
            return Theme.images.orders
        case .favorites:
            return Theme.images.favorites
        case .profile:
            return Theme.images.profile
        }
    }
    
    var imageInactive: Image {
        switch self {
        case .home:
            return Theme.images.home
        case .booking:
            return Theme.images.orders
        case .favorites:
            return Theme.images.favorites
        case .profile:
            return Theme.images.profile
        }
    }
}

