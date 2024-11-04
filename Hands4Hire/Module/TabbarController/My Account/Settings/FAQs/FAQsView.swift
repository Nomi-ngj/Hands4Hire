//
//  FAQsView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 29/07/2024.
//

import SwiftUI

struct FAQsView: View {
    var body: some View {
        Form {
            Section(header: Text(localized: Theme.localized.fAQs.localized()).font(Theme.fonts.caption3)) {
                Text(localized: Theme.localized.fAQsQuestion1.localized()).font(Theme.fonts.caption1)
                Text(localized: Theme.localized.fAQsQuestion2.localized()).font(Theme.fonts.caption1)
            }
        }
        .navigationTitleWithBackButton(Theme.localized.fAQs.localized())
    }
}

#Preview {
    FAQsView()
}
