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
                            TabBarController(tabs: TabViewType.allCases.map { viewType in
                                TabBarController.TabItem(viewType: viewType)
                            })
                            .navigationDestination(for: Router.ServicesFlow.self) { destination in
                                switch destination {
                                case .service(let item):
                                    ServiceDetailView(item: item)
                                        .navigationTitleWithBackButton(item.title)
                                case .services(let title, let items):
                                    ServiceVerticalSectionView(title: title, items: items)
                                        .navigationTitleWithBackButton(title)
                                    
                                case .serviceProvider(let serviceProviderItem):
                                    ServiceProviderDetailView(provider: serviceProviderItem)
                                        .navigationTitleWithBackButton(serviceProviderItem.name)
                                    
                                case .reviews(let serviceReviews):
                                    ReviewListView(reviews: serviceReviews)
                                }
                            }
                        }else {
                            
                            LoginView()
                                .navigationDestination(for: Router.AuthFlow.self) { destination in
                                    
                                    switch destination {
                                    case .login: LoginView()
                                    case .createAccount: SignUpView(viewModel: .init())
                                    case .forgotPassword: UnderConstructionView()
                                            .navigationTitleWithBackButton("Forgot Password")
                                    }
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
