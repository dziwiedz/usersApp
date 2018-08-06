//
//  GithubUser.swift
//  Domain
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

struct GithubUser: UserProtocol {
    let username: String
    let avatarUrl: String
    let from: UserSource = .github
    
    
}
