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
    @IBOutlet weak var jobTitelLabel: UILabel!
}

class JobsCreatedController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let elements = ["e", "hh"]
    
    @IBOutlet weak var jobsCreatedTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jobsCreatedTableView.dequeueReusableCell(withIdentifier: "JobCreatedCell", for: indexPath) as!JobCreatedTableViewCell
        
        cell.dateOfCreationLabel?.text = "dddd"
        cell.jobTitelLabel?.text = "sdfsds"
        
        return cell
    }
    

    
    @IBOutlet weak var createNewJobButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobsCreatedTableView.delegate = self
        jobsCreatedTableView.dataSource = self

        createNewJobButton.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
