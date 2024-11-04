//
//  AdvertisementBannersView.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 05/11/2024.
//

import SwiftUI

import SwiftUI

struct AdvertisementBannersView: View {
    let allServices: [ServiceItem]
    @State private var currentIndex: Int = 0
    @State private var isDragging: Bool = false
    @EnvironmentObject var appManager: AppContainerManager
    
    // Timer that runs every 3 seconds
    private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // Public initializer to make the view accessible
    init(allServices: [ServiceItem]) {
        self.allServices = allServices
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(allServices.indices, id: \.self) { index in
                    AdvertisementBannerCard(service: allServices[index])
                        .tag(index)
                        .gesture(
                            DragGesture()
                                .onChanged { _ in
                                    // When dragging starts, stop the timer
                                    isDragging = true
                                }
                                .onEnded { _ in
                                    // Resume timer when dragging stops
                                    isDragging = false
                                }
                        )
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .animation(.easeInOut, value: currentIndex)
            .onReceive(timer) { _ in
                // Only auto-scroll if not dragging
                if !isDragging {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % allServices.count
                    }
                }
            }
        }
        .onAppear {
            // Customize the PageTabViewStyle dots
            UIPageControl.appearance().currentPageIndicatorTintColor = appManager.theme.color.primaryUIColor // Active dot color
            UIPageControl.appearance().pageIndicatorTintColor = appManager.theme.color.whiteUIColor // Inactive dots color
        }
        .frame(height: 220) // Adjust height as needed
    }
}

