//
//  MyAccountView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import Foundation
import UIKit
import SwiftUI

struct MyAccountView: View {
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            List(MyAccountFlow.allCases, id: \.self) { section in
                Button(action: {
                    router.navigate(to: section)
                }) {
                    Text(localized: section.title)
                        .font(Theme.fonts.caption1)
                        .foregroundColor(appManager.theme.color.primaryColor)
                }
            }
            .preferredColorScheme(appManager.colorScheme)
            .navigationTitle(Theme.localized.myAccount.localized())
        }
    }
}


