//
//  ProfileView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}

struct ProfileView: View {
    @ObservedObject private var viewModel: ProfileViewModel
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        Form {
            Section(header: Text(Theme.localized.profilePicture)
                .font(Theme.fonts.caption3)) {
                    ProfileImage(urlString: viewModel.user.profilePictureURL)
                }
            
            Section(header: Text(Theme.localized.accountInformation)
                .font(Theme.fonts.caption3)) {
                    Text(viewModel.user.username)
                        .font(Theme.fonts.caption2)
                    Text(viewModel.user.email)
                        .font(Theme.fonts.caption2)
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.user)
    }
}

