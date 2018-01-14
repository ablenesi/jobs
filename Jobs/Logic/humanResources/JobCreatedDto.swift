//
//  JobCreatedDto.swift
//  Jobs
//
//  Created by MaierLevente on 08/01/2018.
//  Copyright © 2018 Attila Blenesi. All rights reserved.
//

import UIKit

class JobCreatedDto {

    var id : String
    var name : String
    var dateOfCreation : String
    
    init(id : String, name : String, dateOfCreation : String) {
        self.id = id
        self.name = name
        self.dateOfCreation = dateOfCreation
    }
    
}
