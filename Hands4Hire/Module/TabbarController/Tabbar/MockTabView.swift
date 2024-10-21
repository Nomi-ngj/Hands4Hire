//
//  MockTabView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

struct MockTabView: View {
    @EnvironmentObject var appManager: AppContainerManager
    var body: some View {
        ScrollView{
            MockVerticalListView()
                .environmentObject(appManager)
        }
        .preferredColorScheme(appManager.colorScheme)
    }
}
