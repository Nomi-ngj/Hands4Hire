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
        
        // Firestore settings
        let db = Firestore.firestore()
        let settings = FirestoreSettings()
        // Enable offline persistence (default is enabled)
        settings.isPersistenceEnabled = true

        
        // Set cache size (use FirestoreCacheSizeUnlimited for unlimited cache size if available)
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited // or specify a size like 10 * 1024 * 1024 (10 MB)

        db.settings = settings
        return true
    }
}


@main
struct Hands4HireApp: App {
    
    @State private var showSplash = true
    @ObservedObject private var appManager = AppContainerManager()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView{
                    if showSplash {
                        SplashScreenView(showSplash: $showSplash)
                            .environmentObject(appManager)
                    } else {
                        if appManager.isUserLoggedIn {
                            TabBarController(tabs: TabViewType.allCases.map { viewType in
                                TabBarController.TabItem(viewType: viewType)
                            })
                            .environmentObject(appManager)
                        }else {
                            LoginView()
                                .environmentObject(appManager)
                        }
                    }
                }
            }
            .onAppear{
                appManager.isUserLoggedIn = Theme.sessionManager.userProfile != nil
                _ = LocalizationManager.shared
//                 FirestoreSeeder.init().seedData()
            }
        }
    }
}
