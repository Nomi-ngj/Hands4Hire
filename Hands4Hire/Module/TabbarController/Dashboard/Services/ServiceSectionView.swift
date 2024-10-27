//
//  ServiceSectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct ServiceSectionView: View {
    var title: String
    var items: [ServiceItem]
    
    @EnvironmentObject var appManager: AppContainerManager
    @EnvironmentObject var router: Router
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: title, onSeeAllTapped: {
                router.navigate(to: .services(title:title, serviceItems: items))
            })
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items) { item in
                        ServiceItemView(item: item).environmentObject(appManager)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
