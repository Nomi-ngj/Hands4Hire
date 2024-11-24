//
//  BookingFlow.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 11/11/2024.
//

import Foundation
import SwiftUI

enum BookingFlow: Hashable, Codable {
    case createBooking(serviceProvider: ServiceProvider?)
    case showAlert(alertParams: AlertParams?)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .createBooking(let serviceProvider):
            BookingView(viewModel: .init(serviceProvider: serviceProvider))
                .customBackButton()
        case .showAlert(let alertParams):
            CustomAlertView(alertParams: alertParams, shouldShow: .constant(false))
        }
    }
}

