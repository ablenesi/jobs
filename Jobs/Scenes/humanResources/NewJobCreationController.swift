//
//  NewJobCreationController.swift
//  Jobs
//
//  Created by MaierLevente on 13/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class NewJobCreationController: UIViewController {

    @IBOutlet weak var jobTitleTextField: UITextField!
    
    @IBOutlet weak var jobDescriptionTextView: UITextView!
    
    @IBOutlet weak var saveNewJobButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobDescriptionTextView.layer.borderWidth = 0.5
        jobDescriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        saveNewJobButton.backgroundColor = UIColor.blue
        saveNewJobButton.setTitleColor(.white, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveNewJobAction(_ sender: Any) {
    }
    
    

}
