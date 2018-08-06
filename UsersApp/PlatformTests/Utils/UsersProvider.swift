//
//  UsersProvider.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain
final class UsersProvider {
    static func makeGithubUsers(howManny value: Int) -> [GithubUser] {
        var users: [GithubUser] = []
        for i in 0..<value {
            users.append(GithubUser(username: "No. \(i)", avatarUrl: "https://somepage.pl/someimage.png"))
        }
        return users
    }
    
    static func makeDailymotionUsers(howManny value: Int) -> [DailyMotionUser] {
        var users: [DailyMotionUser] = []
        for i in 0..<value {
            users.append(DailyMotionUser(username: "No. \(i)", avatarUrl: "https://somepage.pl/someimage.png"))
        }
        return users
    }
}
