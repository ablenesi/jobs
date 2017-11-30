//
//  Application.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/20/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation

class Application {
    public var user : User
    public var job : Job
    public var process: [Step]
    
    init(user : User, job : Job) {
        self.user = user
        self.job = job
        process = [Step]()
    }
    
    public func getStep(pos: Int) -> (String, Step) {
        return (job.process[pos] , process[pos])
    }
    
    class Step {
        var passed : Bool
        var date: NSDate
        
        init( passed : Bool,date: NSDate ) {
            self.passed = passed
            self.date = date
        }
    }
}
