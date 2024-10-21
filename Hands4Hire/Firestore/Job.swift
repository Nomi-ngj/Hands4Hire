//
//  Job.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import FirebaseFirestore

struct Job: Identifiable, Codable {
    @DocumentID var id: String?
    var userId: String // Reference to the User who created the job
    var serviceProviderId: String // Reference to the service provider
    var serviceId: String // Reference to the service
    var location: Address
    var jobTime: String // "full_time" or "hourly"
    var rate: Double
    var status: String // "pending", "in_progress", "completed", "cancelled"
    var createdAt: Date
    var updatedAt: Date
}
