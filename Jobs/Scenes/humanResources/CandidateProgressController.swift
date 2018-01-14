//
//  CandidateProgressController.swift
//  Jobs
//
//  Created by MaierLevente on 14/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class CandidateProgressMilestoneViewCell: UITableViewCell {
    
    @IBOutlet weak var milestoneStateImageView: UIImageView!
    @IBOutlet weak var milestoneNameLabel: UILabel!
}

class CandidateProgressController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var candidateNameLabel: UILabel!
    
    @IBOutlet weak var candidateMilestoneTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidateNameLabel.text = "Steven Schwenke"
        
        candidateMilestoneTableView.delegate = self
        candidateMilestoneTableView.dataSource = self
        
        candidateMilestoneTableView.rowHeight = 125
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = candidateMilestoneTableView.dequeueReusableCell(withIdentifier: "candidateProgressMilestoneId", for: indexPath) as!CandidateProgressMilestoneViewCell
        
        cell.milestoneNameLabel?.text = "HR Interview"
        
        return cell
        
    }
}
