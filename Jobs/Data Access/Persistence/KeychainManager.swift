//
//  KeychainManager.swift
//  Jobs
//
//  Created by Attila Blenesi on 12/19/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation
import KeychainSwift

private struct Keys {
    static let user = "user"
    static let token = "token"
}

class KeychainManager {
    
    // Mark: - Properties
    private let keychain = KeychainSwift()
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // Mark: - Properties
    static let shared = KeychainManager()
    
    // Mark: - Methods
    
    /// Stores the backend Auth Token
    var authToken: String? {
        set(token) {
            if let token = token {
                keychain.set(token, forKey: Keys.token)
            } else {
                keychain.delete(Keys.token)
            }
        }
        get {
            guard let data = keychain.get(Keys.token) else { return nil }
            return data
        }
    }
    
    /// Stores the current user
    var user: CurrentUser? {
        set(user) {
            if let user = user {
                do {
                    let dataJSON = try encoder.encode(user)
                    keychain.set(dataJSON, forKey: Keys.user)
                } catch {
                    fatalError("Error will set user in keychain")
                }
            } else {
                keychain.delete(Keys.user)
            }
        }
        get {
            if let dataJSON = keychain.getData(Keys.user) {
                do {
                    let user = try decoder.decode(CurrentUser.self, from: dataJSON)
                    return user
                } catch {
                    return nil
                }
            }
            return nil
        }
    }
    
}
