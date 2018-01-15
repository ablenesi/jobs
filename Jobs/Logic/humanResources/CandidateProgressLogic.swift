//
//  CandidateProgressLogic.swift
//  Jobs
//
//  Created by MaierLevente on 14/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class CandidateProgressLogic: NSObject {
    
    func loadMilestonesForCandidateAtPosition(userId : String, jobId : String) -> [MilestoneDto] {
        var milestonesForCandidate = [MilestoneDto]()
        
        let job1 = MilestoneDto(milestoneName: "HR Interview", passed: true)
        milestonesForCandidate.append(job1)
        
        let job2 = MilestoneDto(milestoneName: "Tech Interview", passed: true)
        milestonesForCandidate.append(job2)
        
        let job3 = MilestoneDto(milestoneName: "Contract", passed: false)
        milestonesForCandidate.append(job3)
        
        return milestonesForCandidate
    }
    
}
