//
//  ToastView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/11/2024.
//

import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .padding()
            .background(Color.black.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal, 16)
    }
}
