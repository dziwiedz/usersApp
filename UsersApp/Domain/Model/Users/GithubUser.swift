//
//  GithubUser.swift
//  Domain
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

public struct GithubUser: UserProtocol {
    public let username: String
    public let avatarUrl: String
    public let from: UserSource = .github
    
    public init(username: String, avatarUrl: String) {
        self.username = username
        self.avatarUrl = avatarUrl
    }
    
    
}
