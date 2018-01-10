//
//  JobsCreatedController.swift
//  Jobs
//
//  Created by MaierLevente on 09/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class JobCreatedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateOfCreationLabel: UILabel!
    
    @IBOutlet weak var jobTitleLabel: UILabel!
}

class JobsCreatedController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let elements = ["e", "hh"]
    var jobsCreatedLogic = JobsCreatedLogic()
    
    @IBOutlet weak var jobsCreatedTableView: UITableView!
    
    @IBOutlet weak var createNewJobButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobsCreatedTableView.delegate = self
        jobsCreatedTableView.dataSource = self
        
        jobsCreatedTableView.rowHeight = 125

        createNewJobButton.backgroundColor = UIColor.blue
        createNewJobButton.setTitleColor(.white, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsCreatedLogic.loadCreatedJobs(company: "companyName").count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobsCreatedTableView.dequeueReusableCell(withIdentifier: "JobCreatedCell", for: indexPath) as!JobCreatedTableViewCell
        
        var jobsCreatedByCompany = jobsCreatedLogic.loadCreatedJobs(company: "companyName")
        
        cell.dateOfCreationLabel?.text = jobsCreatedByCompany[indexPath.row].dateOfCreation
        cell.jobTitleLabel?.text = jobsCreatedByCompany[indexPath.row].name
        
        return cell
    }
}
