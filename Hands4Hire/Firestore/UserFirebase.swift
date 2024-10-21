//
//  UserFirebase.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import FirebaseFirestore

struct UserFirebase: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var email: String
    var phone: String
    var loginType: String // "user", "service_provider", or "agency"
    var address: Address
    var userTypeDetails: UserTypeDetails?  // Nullable in case of different user types
    var createdAt: Date
    var updatedAt: Date
}

extension UserFirebase{
    
    static func createMockUsers() -> [UserFirebase] {
        return [
            // Mock Service Provider
            UserFirebase(
                id: nil,
                name: "Alice Johnson",
                email: "alice@example.com",
                phone: "555-1234",
                loginType: "service_provider",
                address: Address(city: "New York", state: "NY", zipCode: "10001"),
                userTypeDetails: UserTypeDetails(
                    services: ["housemaid", "cleaner"],
                    location: "live_out",
                    jobTime: "full_time",
                    rate: 20.0
                ),
                createdAt: Date(),
                updatedAt: Date()
            ),
            // Mock Regular User
            UserFirebase(
                id: nil,
                name: "Bob Smith",
                email: "bob@example.com",
                phone: "555-5678",
                loginType: "user",
                address: Address(city: "Chicago", state: "IL", zipCode: "60601"),
                userTypeDetails: nil,  // No userTypeDetails for regular users
                createdAt: Date(),
                updatedAt: Date()
            ),
            // Mock Agency
            UserFirebase(
                id: nil,
                name: "HappyHome Agency",
                email: "agency@happyhome.com",
                phone: "555-8901",
                loginType: "agency",
                address: Address(city: "Los Angeles", state: "CA", zipCode: "90001"),
                userTypeDetails: nil,  // No userTypeDetails for agencies
                createdAt: Date(),
                updatedAt: Date()
            )
        ]
    }
}

struct UserTypeDetails: Codable {
    let services: [String]  // e.g., ["housemaid", "cleaner"]
    let location: String    // e.g., "live_out"
    let jobTime: String     // e.g., "full_time"
    let rate: Double        // e.g., 20
}

struct Address: Codable {
    var city: String
    var state: String
    var zipCode: String
}
