//
//  ApplicantDto.swift
//  Jobs
//
//  Created by MaierLevente on 14/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class ApplicantDto {
    
    var id : String
    var candidateName : String
    var desiredPosition : String
    
    init(id : String, candidateName : String, desiredPosition : String) {
        self.id = id
        self.candidateName = candidateName
        self.desiredPosition = desiredPosition
    }
    
}
