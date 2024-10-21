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
            Section(header: Text("Contact Us")) {
                Text("For support, please email us at support@example.com")
            }
        }
        .customBackButton()
        .navigationTitle("Contact Us")
    }
}


#Preview {
    ContactUsView()
}
