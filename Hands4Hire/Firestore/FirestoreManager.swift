//
//  FirestoreManager.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import FirebaseFirestore


class FirestoreManager: ObservableObject {
    private let db = Firestore.firestore()

    // Fetch all users
    func fetchUsers(completion: @escaping ([UserFirebase]?) -> Void) {
        db.collection("users").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching users: \(error)")
                completion(nil)
                return
            }
            let users = snapshot?.documents.compactMap { try? $0.data(as: UserFirebase.self) }
            completion(users)
        }
    }

    // Fetch all services
    func fetchServices(completion: @escaping ([Service]?) -> Void) {
        db.collection("services").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching services: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents found")
                completion(nil)
                return
            }
            
            let services: [Service] = documents.compactMap { document in
                do {
                    let service = try document.data(as: Service.self)
                    return service
                } catch {
                    print("Error decoding document \(document.documentID): \(error.localizedDescription)")
                    return nil
                }
            }
            //            let services = snapshot?.documents.compactMap { try? $0.data(as: Service.self) }
            completion(services)
        }
    }

    // Fetch jobs for a specific user
    func fetchJobs(forUser userId: String, completion: @escaping ([Job]?) -> Void) {
        db.collection("jobs")
            .whereField("userId", isEqualTo: userId)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error fetching jobs: \(error)")
                    completion(nil)
                    return
                }
                let jobs = snapshot?.documents.compactMap { try? $0.data(as: Job.self) }
                completion(jobs)
            }
    }

    // Add a new job
    func addJob(job: Job, completion: @escaping (Bool) -> Void) {
        do {
            let _ = try db.collection("jobs").addDocument(from: job)
            completion(true)
        } catch {
            print("Error adding job: \(error)")
            completion(false)
        }
    }

    // Update a user's information
    func updateUser(user: UserFirebase, completion: @escaping (Bool) -> Void) {
        guard let userId = user.id else { return }
        do {
            try db.collection("users").document(userId).setData(from: user)
            completion(true)
        } catch {
            print("Error updating user: \(error)")
            completion(false)
        }
    }
}
