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
            Section(header: Text("FAQs").font(Theme.fonts.caption3)) {
                Text("Q: How do I reset my password?\nA: You can reset your password from the settings menu.").font(Theme.fonts.caption1)
                Text("Q: How do I contact support?\nA: You can contact support by emailing support@example.com.").font(Theme.fonts.caption1)
            }
        }
        .navigationTitleWithBackButton("FAQs")
    }
}

#Preview {
    FAQsView()
}
