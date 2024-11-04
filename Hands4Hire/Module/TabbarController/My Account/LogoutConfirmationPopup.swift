//
//  LogoutConfirmationPopup.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 30/10/2024.
//

import SwiftUI

struct LogoutConfirmationPopup: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    var body: some View {
        VStack(spacing: 20) {
            Text(localized: Theme.localized.areYouSureYouWantTologOut.localized())
                .font(Theme.fonts.subhead)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 40) {
                Button(action: {
                    router.navigateBack()
                }) {
                    Text(localized: Theme.localized.cancel.localized())
                        .frame(minWidth: 60)
                        .padding()
                        .font(Theme.fonts.footnote)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    router.navigateToRoot()
                    appManager.isUserLoggedIn = false
                }) {
                    Text(localized: Theme.localized.logout.localized())
                        .frame(minWidth:60)
                        .padding()
                        .font(Theme.fonts.footnoteMedium)
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .frame(width: 300, height: 150)
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
        .shadow(radius: 20)
    }
}
