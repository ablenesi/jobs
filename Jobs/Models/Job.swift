//
//  Job.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/20/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//
import UIKit

struct Job {
    
    var jobId: String
    var title : String
    var description : String
    var company : String
    var createdAt : NSDate
    var hrId: String
    var process: [String]
    var isActive : Bool
    
    var dictionary: [String: Any]{
        return[
            "title": title,
            "description": description,
            "company": company,
            "createdAt": createdAt.timeIntervalSince1970,
            "hrId": hrId,
            "process": process,
            "isActive": isActive
        ]
    }
}
