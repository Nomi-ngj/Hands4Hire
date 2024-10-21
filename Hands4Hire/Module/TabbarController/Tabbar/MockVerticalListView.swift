//
//  MockVerticalListView.swift
//
//
//  Created by Nouman Gul Junejo on 04/08/2023.
//

import SwiftUI

struct MockVerticalListView: View {
    @EnvironmentObject var appManager: AppContainerManager

    var body: some View {
        VStack(spacing: 12) {
            ForEach(1...30, id: \.self) { index in
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 60, height: 60)
                        Text("\(index)")
                            .foregroundColor(.secondary)
                            .font(.body)
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 22)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 22)
                            .padding(.trailing, 80)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 22)
                            .padding(.trailing, 160)
                    }
                }
            }
        }
        .padding()
        .preferredColorScheme(appManager.colorScheme) // Apply color scheme here
    }
}


//#if DEBUG
//#Preview{
//    MockVerticalListView()
//}
//#endif
