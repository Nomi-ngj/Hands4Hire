//
//  FirestoreSeeder.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import FirebaseFirestore

class FirestoreSeeder {
    private let db = Firestore.firestore()
    
    // Function to seed mock data
    func seedData() {
//        seedUsers()
        seedServices()
//        seedJobs()
    }

    // Mock data for users
    private func seedUsers() {
        let users = UserFirebase.createMockUsers()

        for user in users {
            do {
                try db.collection("users").addDocument(from: user)
                print("User \(user.name) successfully added!")
            } catch let error {
                print("Error adding user: \(error)")
            }
        }
    }

    // Mock data for services
    private func seedServices() {
        let services = Service.createMockServices()
        for service in services {
            do {
                try db.collection("services").addDocument(from: service)
                print("Service \(service.name) successfully added!")
            } catch let error {
                print("Error adding service: \(error)")
            }
        }

//        for service in services {
//            db.collection("services").addDocument(data: service) { err in
//                if let err = err {
//                    print("Error adding service: \(err)")
//                } else {
//                    print("Service successfully added!")
//                }
//            }
//        }
    }

    // Mock data for jobs
    private func seedJobs() {
        let jobs: [[String: Any]] = [
            [
                "user_id": "userId1",  // Reference your seeded user documents
                "service_provider_id": "serviceProviderId1", // Reference seeded service provider documents
                "service_id": "serviceId1",  // Reference seeded service documents
                "location": [
                    "city": "New York",
                    "state": "NY",
                    "zip_code": "10001"
                ],
                "job_time": "full_time",
                "rate": 200,
                "status": "pending",
                "created_at": Timestamp(date: Date()),
                "updated_at": Timestamp(date: Date())
            ],
            [
                "user_id": "userId2",
                "service_provider_id": "serviceProviderId2",
                "service_id": "serviceId2",
                "location": [
                    "city": "Chicago",
                    "state": "IL",
                    "zip_code": "60601"
                ],
                "job_time": "hourly",
                "rate": 15,
                "status": "in_progress",
                "created_at": Timestamp(date: Date()),
                "updated_at": Timestamp(date: Date())
            ]
        ]

        for job in jobs {
            db.collection("jobs").addDocument(data: job) { err in
                if let err = err {
                    print("Error adding job: \(err)")
                } else {
                    print("Job successfully added!")
                }
            }
        }
    }
}
