//
//  UsersListView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import SwiftUI

struct UsersListView: View {
    @ObservedObject var firestoreManager = FirestoreManager()
    @State private var users: [UserFirebase] = []
    
    var body: some View {
        List(users) { user in
            VStack(alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.email).font(.subheadline)
            }
        }
        .onAppear {
            firestoreManager.fetchUsers { fetchedUsers in
                if let fetchedUsers = fetchedUsers {
                    self.users = fetchedUsers
                }
            }
        }
    }
}

