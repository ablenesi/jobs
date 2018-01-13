//
//  NewJobCreationController.swift
//  Jobs
//
//  Created by MaierLevente on 13/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class NewJobCreationController: UIViewController {

    @IBOutlet weak var jobDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jobDescriptionTextView.layer.borderWidth = 0.5
        jobDescriptionTextView.layer.borderColor = UIColor.lightGray.cgColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
