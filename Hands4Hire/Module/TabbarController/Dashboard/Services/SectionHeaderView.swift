//
//  SectionHeaderView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

class SectionHeaderViewModel: ObservableObject {
    @Published var primaryColor: Color
    @Published var backgroundColor: Color
    @Published var shadowColor: Color
    
    init(colorScheme: ColorScheme) {
        // Initialize colors based on the provided color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.textPrimaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.navyBlueTextColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.blackColor : Theme.color.whiteColor
    }
    
    func updateColors(for colorScheme: ColorScheme) {
        // Update colors based on the new color scheme
        self.primaryColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.textPrimaryColor
        self.shadowColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.navyBlueTextColor
        self.backgroundColor = colorScheme == .dark ? Theme.color.blackColor : Theme.color.whiteColor
    }
}

struct SectionHeaderView: View {
    var title: String
    var shouldShow = true
    var onSeeAllTapped: (() -> Void)? = nil  // Callback closure for button action

    @EnvironmentObject var appManager: AppContainerManager
    @ObservedObject var viewModel: SectionHeaderViewModel
    @Environment(\.colorScheme) private var userColorScheme
    
    var body: some View {
        HStack {
            Text(title)
                .font(Theme.fonts.headline)
                .foregroundColor(viewModel.primaryColor)
            
            Spacer()
            if shouldShow{
                Button(action: {
                    self.onSeeAllTapped?()
                }) {
                    Text("See all")
                        .font(Theme.fonts.caption4)
                        .foregroundColor(viewModel.shadowColor)
                }
            }
            
        }
        .padding(.horizontal)
//        .background(.clear)
        .onChange(of: appManager.isDarkMode) { newColorScheme in
            // Update ViewModel when the color scheme changes
            viewModel.updateColors(for: appManager.colorScheme)
        }
        .onChange(of: userColorScheme) { newColorScheme in
            appManager.isDarkMode = newColorScheme == .dark
        }
        .onAppear {
            // Update ViewModel when the view appears
            viewModel.updateColors(for: appManager.colorScheme)
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
