//
//  JobCreatedDto.swift
//  Jobs
//
//  Created by MaierLevente on 08/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class JobCreatedDto {

    var name : String
    var dateOfCreation : String
    
    init(name : String, dateOfCreation : String) {
        self.name = name
        self.dateOfCreation = dateOfCreation
    }
    
}
