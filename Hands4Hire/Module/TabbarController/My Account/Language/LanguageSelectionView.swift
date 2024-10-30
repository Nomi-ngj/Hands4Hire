//
//  LanguageSelectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 25/10/2024.
//

import SwiftUI


struct LanguageSelectionView: View {
    @ObservedObject private var localizationManager = LocalizationManager.shared

    var body: some View {
        List(AppLanguage.allCases) { language in
            HStack {
                Text(language.displayName)
                    .font(Theme.fonts.caption1)
                Spacer()
                if language == localizationManager.selectedLanguage {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                localizationManager.selectedLanguage = language
                _ = LocalizationManager.shared
            }
        }
    }
}
