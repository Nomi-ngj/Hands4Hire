//
//  BorderedButtonStyle.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 27/07/2024.
//

import SwiftUI

struct BorderedButtonStyle: ButtonStyle {
    let borderColor: Color
    let foregroundColor: Color
    let backgroundColor: Color
    let font: Font
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
            .foregroundColor(foregroundColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(5.0)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(borderColor, lineWidth: 1.0)
            )
    }
}
