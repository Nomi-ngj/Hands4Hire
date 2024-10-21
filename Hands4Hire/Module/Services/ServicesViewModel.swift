//
//  ServicesViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class ServicesViewModel: ObservableObject {
    @Published var services: [Service] = []
    @ObservedObject var firestoreManager = FirestoreManager()
    
    init() {
        fetchServices()
    }
    
    func fetchServices() {
        
        firestoreManager.fetchServices { fetchedUsers in
            if let fetchedUsers = fetchedUsers {
                self.services = fetchedUsers
            }
        }
    }
}
