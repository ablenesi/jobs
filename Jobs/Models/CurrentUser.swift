//
//  CurrentUser.swift
//  Jobs
//
//  Created by Attila Blenesi on 12/19/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation

class CurrentUser: Codable {
    
    var name: String
    var email: String
    var profileImageUrl: URL
    
    init(name: String, email: String, profileImageUrl: URL) {
        self.name = name
        self.email = email
        self.profileImageUrl = profileImageUrl
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let user = try decoder.container(keyedBy: UserKey.self)
            
            let values = try user.nestedContainer(keyedBy: UserInfoKeys.self, forKey: .user)
            name = try values.decode(String.self, forKey: .name)
            email = try values.decode(String.self, forKey: .email)
            profileImageUrl = try values.decode(URL.self, forKey: .profileImageUrl)
        } catch {
            let values = try decoder.container(keyedBy: UserInfoKeys.self)
            name = try values.decode(String.self, forKey: .name)
            email = try values.decode(String.self, forKey: .email)
            profileImageUrl = try values.decode(URL.self, forKey: .profileImageUrl)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UserKey.self)
        var userInfoContainer = container.nestedContainer(keyedBy: UserInfoKeys.self, forKey: .user)
        try userInfoContainer.encode(name, forKey: .name)
        try userInfoContainer.encode(email, forKey: .email)
        try userInfoContainer.encode(profileImageUrl, forKey: .profileImageUrl)
    }
    
    enum UserKey: String, CodingKey {
        case user
    }
    
    enum UserInfoKeys: String, CodingKey {
        case name
        case email
        case profileImageUrl
    }
    
}
