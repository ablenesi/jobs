//
//  GoogleSignInService.swift
//  Jobs
//
//  Created by Attila Blenesi on 12/18/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation
import GoogleSignIn
import Firebase

private struct GErrorCode {
    static let userCanceledTheSignIn = -5
}

protocol GoogleSignInDelegate: class {
    func didFinishGoogleSignIn(_ authentication: GIDAuthentication)
    func didFaildGoogleSignIn()
}

class GoogleSignInService: NSObject{
    var delegate: GoogleSignInDelegate? = nil
    
    func signIn(){
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func signOut(){
        GIDSignIn.sharedInstance().signOut()
        KeychainManager.shared.user = nil
    }
}

// MARK: - Extension
extension GoogleSignInService: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            delegate?.didFinishGoogleSignIn(user.authentication)
        } else {
            if (error as NSError).code != GErrorCode.userCanceledTheSignIn {
                delegate?.didFaildGoogleSignIn()
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        NotificationCenter.default.post(name: .didLogOut, object: nil)
    }
}
