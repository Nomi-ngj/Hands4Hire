//
//  TabBarController.swift
//
//
//  Created by Nouman Gul Junejo on 26/07/2024.
//

import SwiftUI

class TabBarViewModel: ObservableObject{
    
//    @Published var selectionColor:Color = Theme.shared.color.primaryColor
    @Binding var showTopBar:Bool
//    @Published var unSelectionColor:Color = Theme.shared.color.disabledColor
    let fontLabel:Font = Theme.fonts.caption4
    
    init(showTopBar:Binding<Bool>) {
//        self.selectionColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.primaryColor
        _showTopBar = showTopBar
    }
    
//    func updateColors(for colorScheme: ColorScheme) {
//        // Update colors based on the new color scheme
//        self.unSelectionColor = colorScheme == .dark ? Theme.color.whiteColor : Theme.color.disabledColor
//        self.selectionColor = colorScheme == .dark ? Theme.color.secondaryColor : Theme.color.primaryColor
//    }
    
}

struct TabBarController: View {
    
    struct TabItem {
        var viewType: TabBarFlow
    }
    @ObservedObject var viewModel:TabBarViewModel = .init(showTopBar: .constant(false))
    @State private var selectedTab: TabBarFlow
    @State private var tabOpacity = 0.0
    @EnvironmentObject var appManager: AppContainerManager
    
    let tabs: [TabItem]
    init(tabs: [TabItem]) {
        self.tabs = tabs
        _selectedTab = State(initialValue: tabs.first!.viewType)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            selectedTab.view
                .edgesIgnoringSafeArea(.bottom)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.viewType) { tab in
                    Button(action: {
                        withAnimation {
                            selectedTab = tab.viewType
                        }
                    }) {
                        VStack {
                            if viewModel.showTopBar {
                                if tab.viewType == selectedTab {
                                    Rectangle()
                                        .frame(height: 3)
                                        .foregroundColor(.orange)
                                } else {
                                    Divider()
                                        .padding(.horizontal, 0)
                                        .opacity(0.1)
                                }
                            }
                            
                            tab.viewType.imageActive
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25, alignment: .center)
                            
                            if tab.viewType == selectedTab{
                                Text(localized: tab.viewType.title)
                                    .font(viewModel.fontLabel)
                            }
                        }
                        .foregroundColor((tab.viewType == selectedTab ? appManager.theme.color.primaryColor : appManager.theme.color.disabledColor))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .background(appManager.theme.color.whiteColor)
            .frame(height: 70)
            .opacity(tabOpacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    tabOpacity = 1.0
                }
            }
        }
    }
}

#if DEBUG
#Preview{
    VStack{
        TabBarController(tabs: TabBarFlow.allCases.map { viewType in
            TabBarController.TabItem(viewType: viewType)
        })
    }
}
#endif
