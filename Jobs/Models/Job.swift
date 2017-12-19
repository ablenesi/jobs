//
//  Job.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/20/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//
import UIKit

class Job {
    var title : String
    var description : String
    var company : String
    
    var createdAt : NSDate
    var hrId: String
    public var process: [String]
    var isActive : Bool
    
    init(title : String, description : String, company : String, createdAt : NSDate,  hrId: String) {
        self.title = title
        self.description = description
        self.company = company
        self.createdAt = createdAt
        self.hrId = hrId
        self.process = [String]()
        isActive = true
    }
}
