//
//  MyApplicationsViewController.swift
//  Jobs
//
//  Created by MaierLevente on 17/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class MyApplicationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jobNameLabel: UILabel!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    
}
    
class MyApplicationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myApplicationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myApplicationsTableView.delegate = self
        myApplicationsTableView.dataSource = self
        
        myApplicationsTableView.rowHeight = 125
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myApplicationsTableView.dequeueReusableCell(withIdentifier: "MyApplicationCustomCellId", for: indexPath) as!MyApplicationTableViewCell
        
        cell.jobNameLabel?.text = "sdsdsdsd"
        cell.companyNameLabel?.text = "qqqqqq"
        
        return cell
        
    }
    
    @IBAction func didUnwindFromMyApplicationProgressViewController(_ sender: UIStoryboardSegue) {
        
    }
    
}
