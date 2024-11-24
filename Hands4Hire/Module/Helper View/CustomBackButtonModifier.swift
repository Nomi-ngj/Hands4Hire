//
//  CustomBackButtonModifier.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import Foundation
import SwiftUI

struct CustomBackButtonModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var appManager: AppContainerManager
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: customBackButton)
    }
    
    var customBackButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(appManager.theme.color.blackColor)
            }
        }
        .frame(width: 30)
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(CustomBackButtonModifier())
    }
}


extension View {
    func navigationTitle(_ title: String) -> some View {
        self.toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(Theme.fonts.headline)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func navigationTitleWithBackButton(_ title: String) -> some View {
        self.toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(Theme.fonts.headline)
            }
        }
        .customBackButton()
        .navigationBarTitleDisplayMode(.inline)
    }
}
