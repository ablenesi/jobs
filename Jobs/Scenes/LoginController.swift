//
//  LoginController.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/20/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation
import UIKit

import GoogleSignIn

class LoginController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().scopes = ["profile", "email"]
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        
        signInButton.isHidden = true
        
        signUpForNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(KeychainManager.shared.user != nil){
            didFinishSigningIn()
        } else {
            signInButton.isHidden = false
        }
    }
    
    // MARK: - Notifications
    private func signUpForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didFinishSigningIn), name: .didFinishSigningIn, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didFailSigningIn), name: .didFailSigningIn, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didFinishGoogleSignIn), name: .didFinishGoogleSignIn, object: nil)
    }
    
    @objc private func didFinishSigningIn() {
        performSegue(withIdentifier: "login", sender: signInButton)        
    }
    
    @objc private func didFailSigningIn() {
        let signInFailedAlert = UIAlertController(title: "Error", message: "Ooops something went wrong please try again later.", preferredStyle: .alert)
        signInFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(signInFailedAlert, animated: true, completion: nil)
    }
    
    @objc private func didFinishGoogleSignIn() {
        activityIndicator.startAnimating()
        signInButton.isHidden = true
    }
}

// MARK: - Extension - GIDSignInUIDelegate
extension LoginController: GIDSignInUIDelegate {
    
}

