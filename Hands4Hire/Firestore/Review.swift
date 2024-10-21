//
//  Review.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import FirebaseFirestore
import Foundation

struct Review: Identifiable, Codable {
    @DocumentID var id: String?
    var reviewerName: String? // Reference to the related job
    var jobId: String // Reference to the related job
    var userId: String // Reference to the reviewer
    var serviceProviderId: String // Reference to the service provider being reviewed
    var rating: Int
    var comment: String
    var createdAt: Date
    var updatedAt: Date
}


extension Review {
    static let mockReviews: [Review] = [
        Review(id: "1", reviewerName: "Alice", jobId: "job_001", userId: "user_001", serviceProviderId: "provider_001", rating: 5, comment: "Excellent service! The technician was very professional and did a great job.", createdAt: Date(), updatedAt: Date()),
        Review(id: "2", reviewerName: "Bob", jobId: "job_002", userId: "user_002", serviceProviderId: "provider_002", rating: 4, comment: "Very satisfied with the repairs. Would recommend to others.", createdAt: Date(), updatedAt: Date()),
        Review(id: "3", reviewerName: "Catherine", jobId: "job_003", userId: "user_003", serviceProviderId: "provider_003", rating: 4, comment: "Good experience overall, but the appointment was slightly delayed.", createdAt: Date(), updatedAt: Date()),
        Review(id: "4", reviewerName: "David", jobId: "job_004", userId: "user_001", serviceProviderId: "provider_001", rating: 5, comment: "Outstanding work! The team was friendly and efficient.", createdAt: Date(), updatedAt: Date()),
        Review(id: "5", reviewerName: "Eva", jobId: "job_005", userId: "user_004", serviceProviderId: "provider_004", rating: 3, comment: "The service was decent, but I expected better communication.", createdAt: Date(), updatedAt: Date()),
        Review(id: "6", reviewerName: "Frank", jobId: "job_006", userId: "user_005", serviceProviderId: "provider_001", rating: 4, comment: "Very happy with the outcome! They really know their stuff.", createdAt: Date(), updatedAt: Date()),
        Review(id: "7", reviewerName: "Grace", jobId: "job_007", userId: "user_002", serviceProviderId: "provider_002", rating: 4, comment: "Great value for the price. Will hire again for future jobs.", createdAt: Date(), updatedAt: Date()),
        Review(id: "8", reviewerName: "Hannah", jobId: "job_008", userId: "user_003", serviceProviderId: "provider_003", rating: 5, comment: "Superb experience! Highly recommended.", createdAt: Date(), updatedAt: Date()),
        Review(id: "9", reviewerName: "Isaac", jobId: "job_009", userId: "user_004", serviceProviderId: "provider_004", rating: 4, comment: "Good service, but could use more staff to handle requests.", createdAt: Date(), updatedAt: Date()),
        Review(id: "10", reviewerName: "Jack", jobId: "job_010", userId: "user_005", serviceProviderId: "provider_001", rating: 3, comment: "Average experience. The job was done but took longer than expected.", createdAt: Date(), updatedAt: Date())
    ]
}
