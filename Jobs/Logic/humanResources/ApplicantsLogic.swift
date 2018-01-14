//
//  ApplicantsLogic.swift
//  Jobs
//
//  Created by MaierLevente on 14/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class ApplicantsLogic: NSObject {
    
    func loadApplicants(company : String) -> [ApplicantDto] {
        
        var applicantsByCompany = [ApplicantDto]()
        
        let job1 = ApplicantDto(id: "1", candidateName: "Steven Schwenke", desiredPosition: "Android Developer")
        applicantsByCompany.append(job1)
        
        let job2 = ApplicantDto(id: "2", candidateName: "Jan Seidel", desiredPosition: "HR Specialist")
        applicantsByCompany.append(job2)
        
        let job3 = ApplicantDto(id: "3", candidateName: "Alexander Topp", desiredPosition: "JavaFX Developer")
        applicantsByCompany.append(job3)
        
        return applicantsByCompany
        
    }

}
