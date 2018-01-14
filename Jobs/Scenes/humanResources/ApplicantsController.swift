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
    
    var applicantsLogic = ApplicantsLogic()
    
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
        return applicantsLogic.loadApplicants(company: "companyName").count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = candidatesTableView.dequeueReusableCell(withIdentifier: "CandidateCell", for: indexPath) as!CandidateTableViewCell
        
        var applicantsByCompany = applicantsLogic.loadApplicants(company: "companyName")
        
        cell.candidateNameLabel?.text = applicantsByCompany[indexPath.row].candidateName
        cell.desiredJobLabel?.text = applicantsByCompany[indexPath.row].desiredPosition
        
        return cell
    }
    
    @IBAction func didUnwindFromCandidateProgressController(_ sender: UIStoryboardSegue) {
    }
    
}
