//
//  ElevationModifier.swift
//
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

struct ElevationModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: x, y: y)
    }
}

extension View {
    
    func elevationLevel1()-> some View {
        applyShadow(color: .gray.opacity(0.4), radius: 2, x: 0, y: 2)
    }
    
    private func applyShadow(color: Color = Color.black.opacity(0.2), radius: CGFloat = 5, x: CGFloat = 0, y: CGFloat = 2) -> some View {
        modifier(ElevationModifier(color: color, radius: radius, x: x, y: y))
    }
}

struct Elevation: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 100, height: 100)
            .elevationLevel1()
    }
}

#if DEBUG
#Preview{
    Elevation()
}
#endif
