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
    @ObservedObject private var appManager:AppContainerManager = AppContainerManager(isDarkMode: Theme.sessionManager.isDarkModeEnabled, isUserLoggedIn: Theme.sessionManager.isUserLoggedIn)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var router = Router()
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashScreenView(showSplash: $showSplash)
                        .environmentObject(appManager)
                } else {
                    NavigationStack(path: $router.navPath) {
                        if appManager.isUserLoggedIn {
                            TabBarController(tabs: TabBarFlow.allCases.map { viewType in
                                TabBarController.TabItem(viewType: viewType)
                            })
                            .navigationDestination(for: ServicesFlow.self) { destination in
                                destination.view
                            }
                            .navigationDestination(for: MyAccountFlow.self) { destination in
                                destination.view
                            }
                            .navigationDestination(for: SettingsFlow.self) { destination in
                                destination.view
                            }
                        }else {
                            LoginView()
                                .navigationDestination(for: AuthFlow.self) { destination in
                                    destination.view
                                }
                        }       
                    }
                    .environmentObject(appManager)
                    .environmentObject(router)
                }
            }
            .onAppear{
                _ = LocalizationManager.shared
                //                 FirestoreSeeder.init().seedData()
            }
        }
    }
}
