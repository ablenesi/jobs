//
//  AppDelegate.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/13/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private let googleSignInService = GoogleSignInService()
    fileprivate var authentication: GIDAuthentication?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Setup Firebase
        FirebaseApp.configure()
        
        // Setup Google Login
        googleSignInService.delegate = self
        googleSignInService.signIn()
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return self.application(application, open: url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication,annotation: annotation)
    }
    
    fileprivate func signInToFirebase() {
        guard let authentication = authentication else {
            NotificationCenter.default.post(name: .didFailSigningIn, object: nil)
            return
        }
        let credentials = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                NotificationCenter.default.post(name: .didFailSigningIn, object: nil)
            } else {
                if let user = user {
                    let url = NSURLComponents(string: user.photoURL!.absoluteString)
                    url?.queryItems = [URLQueryItem(name: "sz", value: "300")]
                    guard let displayName = user.displayName, let email = user.email, let photoURL = url?.url else {
                        NotificationCenter.default.post(name: .didFailSigningIn, object: nil)
                        return
                    }
                    let currentUser = CurrentUser(name: displayName, email: email, profileImageUrl: photoURL)
                    KeychainManager.shared.user = currentUser
                    KeychainManager.shared.authToken = authentication.accessToken
                    user.getIDTokenForcingRefresh(true, completion: { authToken, error in
                        if error != nil {
                            NotificationCenter.default.post(name: .didFailSigningIn, object: nil)
                        } else {
                            guard let authToken = authToken else { return }
                            KeychainManager.shared.authToken = authToken
                            NotificationCenter.default.post(name: .didFinishSigningIn, object: nil)
                        }
                    })
                }
            }
        })
    }
    
    func signOut() {
        googleSignInService.signOut()
        KeychainManager.shared.authToken = nil
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .didLogOut, object: nil)
            }
        } catch {
            print ("Error signing out: %@", error)
        }
    }
}

// MARK: - Extension
extension AppDelegate: GoogleSignInDelegate {
    func didFinishGoogleSignIn(_ authentication: GIDAuthentication) {
        NotificationCenter.default.post(name: .didFinishGoogleSignIn, object: nil)
        self.authentication = authentication
        signInToFirebase()
    }
    
    func didFaildGoogleSignIn() {
        NotificationCenter.default.post(name: .didFailSigningIn, object: nil)
    }
}
