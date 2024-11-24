//
//  CustomAlertView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 11/11/2024.
//

import SwiftUI

struct CustomAlertView: View {
    
    var alertParams: AlertParams?
    @Binding var shouldShow:Bool
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Text(alertParams?.title ?? "")
                    .font(Theme.fonts.caption2Med)
                    .foregroundColor(.primary)
                
                Text(alertParams?.message ?? "")
                    .font(Theme.fonts.caption2)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                Divider()
                
                Button(action: {
                    shouldShow = false
                    alertParams?.confirmAction?()
                }) {
                    Text(alertParams?.confirmButtonText ?? "OK")
                        .font(Theme.fonts.caption1Med)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.shared.color.primaryColor)
                        .foregroundColor(Theme.shared.color.whiteColor)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 5)
            .frame(maxWidth: 300)
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.1))
    }
}
