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
                                .font(Theme.fonts.footnote)) {
                                    ProfileImage(urlString: viewModel.user.profilePictureURL)
            }
            
            Section(header: Text(Theme.localized.accountInformation)
                                .font(Theme.fonts.footnote)) {
                Text(viewModel.user.username)
                    .font(Theme.fonts.caption2)
                Text(viewModel.user.email)
                    .font(Theme.fonts.caption2)
            }
        }
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.user)
    }
}

