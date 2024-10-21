//
//  ReviewsListView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 19/10/2024.
//

import SwiftUI

struct ReviewListView: View {
    var reviews: [Review] // Pass the list of reviews to this view
    @EnvironmentObject var appManager: AppContainerManager
    var body: some View {
        List(reviews) { review in
            ReviewRow(review: review)
                .padding(.vertical, 8)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.gray.opacity(0.15))
        .toolbar {
            ToolbarItem(placement: .principal) { // Custom font style for the navigation title
                Text("Reviews")
                    .font(Theme.fonts.headline) // Customize font, size, and weight
            }
        }
        .navigationBarTitleDisplayMode(.inline) // This ensures the title has the scrolling effect
    }
}

struct ReviewRow: View {
    var review: Review

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(review.reviewerName ?? "N/A") // You can customize this to fetch the actual reviewer's name
                    .font(Theme.fonts.footnoteMedium)
                Spacer()
                Text("⭐️ \(review.rating)") // Display rating
                    .font(Theme.fonts.caption1)
                    .foregroundColor(.yellow)
            }
            .cornerRadius(8)
            
            Text(review.comment)
                .font(Theme.fonts.caption2)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6)) // Light background for each review
        .cornerRadius(8)
    }
}
