//
//  SecondViewController.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/13/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup with current user
        let currentUser: CurrentUser? = KeychainManager.shared.user
        if(currentUser != nil){
            let processor = RoundCornerImageProcessor(cornerRadius: 100, backgroundColor: Color(white: 0.0, alpha: 0.0))
            profileImage.kf.setImage(with: currentUser?.profileImageUrl, placeholder: nil, options: [.processor(processor)])
            nameLabel.text = currentUser?.name
            emailLabel.text = currentUser?.email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutPressed(_ sender: Any) {
        GoogleSignInService.init().signOut()
        performSegue(withIdentifier: "logout", sender: nameLabel)
    }
}

