//
//  JobsCreatedLogic.swift
//  Jobs
//
//  Created by MaierLevente on 08/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class JobsCreatedLogic: NSObject {

    func loadCreatedJobs(company : String) -> [JobCreatedDto] {
        var jobsCreatedByCompany = [JobCreatedDto]()
        
        let job1 = JobCreatedDto(id: "1", name: "Android Developer", dateOfCreation: "12 October 2018")
        jobsCreatedByCompany.append(job1)
        
        let job2 = JobCreatedDto(id: "2", name: "HR Specialist", dateOfCreation: "20 July 2022")
        jobsCreatedByCompany.append(job2)
        
        let job3 = JobCreatedDto(id: "3", name: "JavaFX Developer", dateOfCreation: "20 August 2019")
        jobsCreatedByCompany.append(job3)
        
        return jobsCreatedByCompany
    }
    
}
