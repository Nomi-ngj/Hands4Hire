//
//  ServiceItemView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct ServiceItemView: View {
    
    @EnvironmentObject var appManager: AppContainerManager
    var item: ServiceItem
    let itemWidth = UIScreen.main.bounds.width * 0.215
    @EnvironmentObject var router: Router
    var body: some View {
        Button {
            router.navigate(to: .service(serviceItem: item))
        } label: {
            VStack(spacing: 8) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal)
                    .frame(height: 120)
                    .cornerRadius(10)
                    .clipped()
                    .elevationLevel1()
                
                Text(localized: item.title.localized())
                    .font(Theme.fonts.caption2)
                    .foregroundColor(appManager.theme.color.primaryColor)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .frame(maxWidth: itemWidth)
                    .frame(height: 48)
                
                Spacer()
                    .frame(height: 0)
            }
        }
        .frame(width: itemWidth)
        .padding(.horizontal)
        .background(appManager.theme.color.whiteColor)
        .cornerRadius(10)
        .shadow(radius: 0.3)
    }
}











