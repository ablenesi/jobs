//
//  MilestoneDto.swift
//  Jobs
//
//  Created by MaierLevente on 14/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class MilestoneDto {

    var milestoneName : String
    var passed : Bool
    
    init(milestoneName : String, passed : Bool) {
        self.milestoneName = milestoneName
        self.passed = passed
    }
}
