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
    @Environment(\.colorScheme) private var colorScheme
    
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
                    .foregroundColor(colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor)
            }
        }
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(CustomBackButtonModifier())
    }
}
