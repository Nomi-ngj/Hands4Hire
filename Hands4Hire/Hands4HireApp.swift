//
//  Hands4HireApp.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 08/09/2024.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        let settings = FirestoreSettings()
        // Enable offline persistence (default is enabled)
//        settings.isPersistenceEnabled = true

//        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited // or specify a size like 10 * 1024 * 1024 (10 MB)

        db.settings = settings
        return true
    }
}


@main
struct Hands4HireApp: App {
    
    @State private var showSplash = true
    @ObservedObject var appManager:AppContainerManager = AppContainerManager(isDarkMode: Theme.sessionManager.isDarkModeEnabled, isUserLoggedIn: Theme.sessionManager.isUserLoggedIn)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var router = Router()
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashScreenView(showSplash: $showSplash, viewModel: .init())
                        .environmentObject(appManager)
                } else {
                    NavigationStack(path: $router.navPath) {
                        
                        switch router.root {
                        case .authentication:
                            LoginView()
                                .navigationDestination(for: AuthFlow.self) { destination in
                                    router.destination(for: destination)
                                }
                        case .dashboard:
                            mainTabBarView
                            
                        }
                    }
                    .environmentObject(appManager)
                    .environmentObject(router)
                }
            }
            .onAppear{
                _ = LocalizationManager.shared
                router.root = Theme.sessionManager.isUserLoggedIn ? .dashboard:.authentication
            }
        }
    }
    
    private var mainTabBarView: some View {
        TabBarController(tabs: TabBarFlow.allCases.map { viewType in
            TabBarController.TabItem(viewType: viewType)
        })
        .navigationDestination(for: ServicesFlow.self) { destination in
            router.destination(for: destination)
        }
        .navigationDestination(for: MyAccountFlow.self) { destination in
            destination.view
        }
        .navigationDestination(for: SettingsFlow.self) { destination in
            destination.view
        }
        .navigationDestination(for: BookingFlow.self) { destination in
            destination.view
        }
    }
}
