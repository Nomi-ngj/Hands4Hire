//
//  ServiceVerticalSectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct ServiceVerticalSectionView: View {
    var section: HomeSection
    var items: [ServiceItem]
    var onSeeAllTapped: (() -> Void)? = nil
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @EnvironmentObject var appManager: AppContainerManager
    @Environment(\.colorScheme) private var userColorScheme
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                if section == .allServices {
                    SectionHeaderView(title: section.title, shouldShow: false, onSeeAllTapped: self.onSeeAllTapped, viewModel: .init(colorScheme: userColorScheme))
                        .environmentObject(appManager)
                }else{
                    SearchBarView()
                        .padding(.vertical, 20)
                }
                
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach(items) { item in
                        ServiceItemView(viewModel: .init(colorScheme: appManager.colorScheme), item: item)
                            .environmentObject(appManager)

                    }
                }.padding(.horizontal)
            }
        }
        .background(Color.gray.opacity(0.15))
        .onChange(of: appManager.isDarkMode) { newColorScheme in
            // Update ViewModel when the color scheme changes
//            viewModel.updateColors(for: appManager.colorScheme)
        }
        .onChange(of: userColorScheme) { newColorScheme in
            appManager.isDarkMode = newColorScheme == .dark
        }
        .preferredColorScheme(appManager.colorScheme)
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}
