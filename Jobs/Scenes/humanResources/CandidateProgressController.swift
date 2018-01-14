//
//  CandidateProgressController.swift
//  Jobs
//
//  Created by MaierLevente on 14/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class CandidateProgressController: UIViewController {

    @IBOutlet weak var candidateNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateNameLabel.text = "Steven Schwenke"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
