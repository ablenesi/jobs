//
//  JobsListViewController.swift
//  Jobs
//
//  Created by MaierLevente on 16/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class JobOfferedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jobNameLabel: UILabel!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
}

class JobsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var jobsOfferedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobsOfferedTableView.delegate = self
        jobsOfferedTableView.dataSource = self
        
        jobsOfferedTableView.rowHeight = 125
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobsOfferedTableView.dequeueReusableCell(withIdentifier: "jobsListCustomCellId", for: indexPath) as!JobOfferedTableViewCell
        
        cell.jobNameLabel?.text = "sdsdsdsd"
        cell.companyNameLabel?.text = "qqqqqq"
        
        return cell
        
    }
    
    @IBAction func didUnwindFromApplicationViewController(_ sender: UIStoryboardSegue) {
        
    }
    
}
