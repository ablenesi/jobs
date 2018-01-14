//
//  ApplicantsController.swift
//  Jobs
//
//  Created by MaierLevente on 13/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var desiredJobLabel: UILabel!
}

class ApplicantsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var candidatesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        candidatesTableView.delegate = self
        candidatesTableView.dataSource = self
        
        candidatesTableView.rowHeight = 125
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = candidatesTableView.dequeueReusableCell(withIdentifier: "CandidateCell", for: indexPath) as!CandidateTableViewCell
        
        cell.candidateNameLabel?.text = "ddddd"
        cell.desiredJobLabel?.text = "qqqqq"
        
        return cell
    }
}
