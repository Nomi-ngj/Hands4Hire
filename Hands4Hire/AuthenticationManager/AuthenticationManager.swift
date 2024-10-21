//
//  AuthenticationManager.swift
//  Hands4Hire
//
//  Created by Nouman Gul Junejo on 12/09/2024.
//

import Foundation
import Firebase
import GoogleSignIn
import AuthenticationServices
import FBSDKLoginKit

//class AuthenticationManager {
//    
//    static let shared = AuthenticationManager()
//    
//    private init() {
//        // Firebase and Google Sign-In configuration
//        FirebaseApp.configure()
//        GIDSignIn.sharedInstance.clientID = FirebaseApp.app()?.options.clientID
//    }
//    
//    // Perform authentication based on provider
//    func authenticate(with provider: AuthProvider, presentingViewController: UIViewController, completion: @escaping (AuthDataResult?, Error?) -> Void) {
//        switch provider {
//        case .google:
//            signInWithGoogle(presentingViewController: presentingViewController, completion: completion)
//        case .apple:
//            signInWithApple(presentingViewController: presentingViewController, completion: completion)
//        case .facebook:
//            signInWithFacebook(presentingViewController: presentingViewController, completion: completion)
//        }
//    }
//    
//    // Sign in with Google
//    private func signInWithGoogle(presentingViewController: UIViewController, completion: @escaping (AuthDataResult?, Error?) -> Void) {
//        GIDSignIn.sharedInstance.signIn(with: GIDConfiguration(clientID: FirebaseApp.app()?.options.clientID ?? ""), presenting: presentingViewController) { user, error in
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//            
//            guard let authentication = user?.authentication, let idToken = authentication.idToken else {
//                completion(nil, NSError(domain: "AuthenticationManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Google authentication failed"]))
//                return
//            }
//            
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//            
//            Auth.auth().signIn(with: credential) { authResult, error in
//                completion(authResult, error)
//            }
//        }
//    }
//    
//    // Sign in with Apple
//    private func signInWithApple(presentingViewController: UIViewController, completion: @escaping (AuthDataResult?, Error?) -> Void) {
//        let request = ASAuthorizationAppleIDProvider().createRequest()
//        request.requestedScopes = [.fullName, .email]
//        
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//        
//        // Handle the completion in the delegate methods
//        // The result will be handled in the delegate methods
//    }
//    
//    // Sign in with Facebook
//    private func signInWithFacebook(presentingViewController: UIViewController, completion: @escaping (AuthDataResult?, Error?) -> Void) {
//        let loginManager = LoginManager()
//        loginManager.logIn(permissions: ["public_profile", "email"], from: presentingViewController) { result, error in
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//            
//            guard let accessToken = AccessToken.current?.tokenString else {
//                completion(nil, NSError(domain: "AuthenticationManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Facebook authentication failed"]))
//                return
//            }
//            
//            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
//            
//            Auth.auth().signIn(with: credential) { authResult, error in
//                completion(authResult, error)
//            }
//        }
//    }
//}
//
//extension AuthenticationManager: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
//    
//    // ASAuthorizationControllerDelegate methods
//    func authorizationController(_ controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            guard let idToken = appleIDCredential.identityToken, let tokenString = String(data: idToken, encoding: .utf8) else {
//                return
//            }
//            
//            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nil)
//            
//            Auth.auth().signIn(with: credential) { authResult, error in
//                // Handle sign-in completion
//                NotificationCenter.default.post(name: .appleSignInCompleted, object: authResult, userInfo: ["error": error])
//            }
//        }
//    }
//    
//    func authorizationController(_ controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        NotificationCenter.default.post(name: .appleSignInCompleted, object: nil, userInfo: ["error": error])
//    }
//    
//    // ASAuthorizationControllerPresentationContextProviding method
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return UIApplication.shared.windows.first { $0.isKeyWindow }!
//    }
//}
