//
//  User.swift
//  Jobs
//
//  Created by Attila Blenesi on 11/20/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//
class User{
    var id : String
    var name : String
    var type : UType
    var email : String
    var imageUrl: String
    
    init(id : String, name : String, type : UType, email : String, imageUrl: String) {
        self.id = id
        self.name = name
        self.type = type
        self.email = email
        self.imageUrl = imageUrl
    }
    
    enum UType {
        case HR
        case JS
    }
}
