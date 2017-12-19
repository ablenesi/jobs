//
//  NSNotification.Name.swift
//  Jobs
//
//  Created by Attila Blenesi on 12/18/17.
//  Copyright © 2017 Attila Blenesi. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    public static let didFinishSigningIn = NSNotification.Name("didFinishSigningIn")
    public static let didFailSigningIn = NSNotification.Name("didFailSigningIn")
    public static let didLogOut = NSNotification.Name("didLogOut")
    public static let didFinishGoogleSignIn = NSNotification.Name("didFinishGoogleSignIn")
}
