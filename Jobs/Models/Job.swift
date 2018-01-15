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
    var createdAt : Date
    var hrId: String
    var process: [String]
    var isActive : Bool
    
    var dictionary: [String: Any]{
        return[
            "jobId": jobId,
            "title": title,
            "description": description,
            "company": company,
            "createdAt": createdAt,
            "hrId": hrId,
            "process": process,
            "isActive": isActive
        ]
    }
}

extension Job: DocumentSerializable {
    
    init?(dictionary: [String : Any]) {
        guard let jobId = dictionary["jobId"] as? String,
            let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String,
            let company = dictionary["company"] as? String,
            let createdAt = dictionary["createdAt"] as? Date,
            let hrId = dictionary["hrId"] as? String,
            let process = dictionary["process"] as? [String],
            let isActive = dictionary["isActive"] as? Bool else { return nil }
        
        self.init(jobId: jobId,
                  title: title,
                  description: description,
                  company: company,
                  createdAt: createdAt,
                  hrId: hrId,
                  process: process,
                  isActive: isActive)
    }
}
