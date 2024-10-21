//
//  ServiceSelectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import SwiftUI

enum ServiceType: String, CaseIterable, Codable {
    case housemaid = "Housemaid"
    case babysitter = "Babysitter"
    case cleaner = "Cleaner"
}

struct ServiceSelectionView: View {
    @State private var selectedService: ServiceType = .housemaid
    @State private var location: String = "Live In"
    @State private var jobTime: String = "Full Time"
    
    let locations = ["Live In", "Live Out"]
    let jobTimes = ["Full Time", "Hourly Rate"]
    
    var body: some View {
        VStack {
            // Service Picker
            Picker("Select Service", selection: $selectedService) {
                ForEach(ServiceType.allCases, id: \.self) { service in
                    Text(service.rawValue).tag(service)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Location Picker
            Picker("Location", selection: $location) {
                ForEach(locations, id: \.self) { location in
                    Text(location)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Job Time Picker
            Picker("Job Time", selection: $jobTime) {
                ForEach(jobTimes, id: \.self) { time in
                    Text(time)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button(action: submitJobDetails) {
                Text("Submit Job Details")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func submitJobDetails() {
        print("Service: \(selectedService.rawValue), Location: \(location), Job Time: \(jobTime)")
        // Navigate to next view or submit these details
    }
}
