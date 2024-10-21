//
//  User.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import Foundation

struct User:Codable {
    let username: String
    let email: String
    let profilePictureURL: String
    var userType: UserType
}

extension User {
    static let user = User(username: "Nouman Gul", email: "Noumanguljunejo@gmail.com", profilePictureURL: "https://media.licdn.com/dms/image/D4D03AQG5cquTJk65ug/profile-displayphoto-shrink_800_800/0/1701194433108?e=1727308800&v=beta&t=YPuai8-9sBbnVqqhTEYtWGeRu35luh8NmnzNoot-Vn8", userType: .user)
}
