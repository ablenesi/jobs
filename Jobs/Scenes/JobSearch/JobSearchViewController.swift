//
//  JobSearchViewController.swift
//  Jobs
//
//  Created by Attila Blenesi on 12/22/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class JobSearchViewController: UITableViewController {
    
    var items: [Job] = []
    
    required init?(coder aDecoder: NSCoder) {
        items = [Job]()
        var i = 0
        while i < 100 {
            let job = Job(
                jobId: "1",
                title: "Job \(i)",
                description: "Description \(i)",
                company: "Halcyon Mobile",
                createdAt:NSDate(),
                hrId: "1",
                process: ["test step", "test step 2"],
                isActive: true)
            items.append(job)
            i = i + 1
        }
        
        super.init(coder: aDecoder)!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobItem") as! JobTableViewCell
        cell.populate(job: items[indexPath.row])
        return cell
    }
    
    func configureCell(cell: UITableViewCell, item: Job)
    {
        let title = cell.viewWithTag(1) as! UILabel
        title.text = item.title
        
        let company = cell.viewWithTag(2) as! UILabel
        company.text = item.company
        
        let createdAt = cell.viewWithTag(3) as! UILabel
        createdAt.text = item.createdAt.debugDescription
        
        let logo = cell.viewWithTag(4) as! UIImageView
        let url = URL(string: "https://pbs.twimg.com/profile_images/634354508060053504/KxAuF-UE_400x400.jpg")
        logo.kf.setImage(with: url)
    }
    
}

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet private var title: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var createdAt: UILabel!
 
    func populate(job: Job) {
        
        // Displaying data, part two
        title.text = job.title
        company.text = job.company
        createdAt.text = job.createdAt.debugDescription
        let url = URL(string: "https://pbs.twimg.com/profile_images/634354508060053504/KxAuF-UE_400x400.jpg")
        logo.kf.setImage(with: url)
        
    }
    
}
