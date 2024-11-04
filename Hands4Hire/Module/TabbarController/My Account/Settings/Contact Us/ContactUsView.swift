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
            VStack {
                Text(localized: Theme.localized.contactUsDetail1.localized()).font(Theme.fonts.caption1)
            }
        }
        .background(.clear)
        .navigationTitleWithBackButton(Theme.localized.contactUs.localized())
    }
}


#Preview {
    ContactUsView()
}
