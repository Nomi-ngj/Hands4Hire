//
//  ServiceVerticalSectionView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 16/10/2024.
//

import SwiftUI

struct ServiceVerticalSectionView: View {
    
    var title:String
    var items: [ServiceItem]
    var showSearchBar = true
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @EnvironmentObject var appManager: AppContainerManager
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                if showSearchBar {
                    SearchBarView()
                        .padding(.vertical, 20)
                }else{
                    SectionHeaderView(title: title, shouldShow: false)
                    
                }
                
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach(items) { item in
                        ServiceItemView(item: item)
                    }
                }.padding(.horizontal)
            }
        }
        .background(Color.gray.opacity(0.15))
    }
}
