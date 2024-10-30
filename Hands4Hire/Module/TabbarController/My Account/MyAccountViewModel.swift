//
//  MyAccountViewModel.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

class MyAccountViewModel: ObservableObject {
    @Published var user: User
    @Published var isLogout: Bool = false

    init(user: User) {
        self.user = user
        // Set primary color based on the initial color scheme
    }
    
    func updateUser(_ user: User) {
        self.user = user
    }
    
    func logout() {
        isLogout.toggle()
    }
}
