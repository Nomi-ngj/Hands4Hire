//
//  Service.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import FirebaseFirestore

struct Service: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String?
    var createdAt: Date
    var updatedAt: Date
}

extension Service{
    // Function to create mock services
    static func createMockServices() -> [Service] {
        return [
            Service(
                id: nil,
                name: "Housemaid",
                description: "Provides house cleaning and maintenance services",
                createdAt: Date(),
                updatedAt: Date()
            ),
            Service(
                id: nil,
                name: "Babysitter",
                description: "Takes care of children for short or long durations",
                createdAt: Date(),
                updatedAt: Date()
            ),
            Service(
                id: nil,
                name: "Cleaner",
                description: "Specializes in deep cleaning and other cleaning services",
                createdAt: Date(),
                updatedAt: Date()
            )
        ]
    }
}
