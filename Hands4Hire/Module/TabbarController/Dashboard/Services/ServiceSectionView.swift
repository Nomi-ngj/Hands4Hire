//
//  ServiceSectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct ServiceSectionView: View {
    var title: String
    var items: [ServiceItem]
    var onSeeAllTapped: (() -> Void)? = nil  // Callback closure for button action
    
    @EnvironmentObject var appManager: AppContainerManager
    @ObservedObject var viewModel: ServiceItemViewModel
    @Environment(\.colorScheme) private var userColorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: title, onSeeAllTapped: self.onSeeAllTapped, viewModel: .init(colorScheme: userColorScheme))
                .environmentObject(appManager)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items) { item in
                        ServiceItemView(viewModel: .init(colorScheme: appManager.colorScheme), item: item).environmentObject(appManager)
                    }
                }
            }
            .padding(.horizontal)
        }
        .onChange(of: appManager.isDarkMode) { newColorScheme in
            // Update ViewModel when the color scheme changes
//            viewModel.updateColors(for: appManager.colorScheme)
        }
        .onChange(of: userColorScheme) { newColorScheme in
            appManager.isDarkMode = newColorScheme == .dark
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
