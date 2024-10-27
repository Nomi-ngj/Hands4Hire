//
//  ServicesListView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import SwiftUI

struct ServicesListView: View {
    @ObservedObject private var viewModel = ServicesViewModel()  // Observe the view model
    
    var body: some View {
        List(viewModel.services) { service in
            VStack(alignment: .leading) {
                Text(service.name)
                    .font(.headline)
                Text(service.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            viewModel.fetchServices()  // Fetch services when view appears
        }
    }
}
