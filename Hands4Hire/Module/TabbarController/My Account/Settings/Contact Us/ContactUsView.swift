//
//  ContactUsView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 29/07/2024.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        Form {
            Section(header: Text("Contact Us").font(Theme.fonts.caption3)) {
                Text("For support, please email us at support@example.com").font(Theme.fonts.caption1)
            }
        }
        .navigationTitleWithBackButton("Contact Us")
    }
}


#Preview {
    ContactUsView()
}
