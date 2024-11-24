//
//  LoadingView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 10/11/2024.
//


import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    var message: String?
    var timerDuration: TimeInterval = 2.0 // Duration for the loading view to stay visible
    
    var body: some View {
        if isLoading {
            VStack {
                ProgressView(message ?? "Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()

                if let message = message {
                    Text(message)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
            }
            .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
            .cornerRadius(12)
            .onAppear {
                // Dismiss loading view after timer duration
                DispatchQueue.main.asyncAfter(deadline: .now() + timerDuration) {
                    isLoading = false
                }
            }
        }
    }
}

