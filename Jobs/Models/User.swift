//
//  User.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/20/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation

struct User{
    var userId : String
    var name : String
    var type : UType
    var email : String
    var imageUrl: String
   
    enum UType {
        case HR
        case JS
    }
    
    var dictionary: [String: Any]{
        return[
            "userId": userId,
            "name": name,
            "type": type.hashValue,
            "email": email,
            "imageUrl": imageUrl
        ]
    }
}

extension User: DocumentSerializable {
    
    init?(dictionary: [String : Any]) {
        guard let userId = dictionary["userId"] as? String,
            let name = dictionary["name"] as? String,
            let type = dictionary["type"] as? Int,
            let email = dictionary["email"] as? String,
            let imageUrl = dictionary["imageUrl"] as? String else { return nil }
        
        var uType = UType.HR
        if(uType.hashValue != type){
            uType = UType.JS
        }
        
        self.init(userId: userId,
            name: name,
            type: uType,
            email: email,
            imageUrl: imageUrl)
    }
}
