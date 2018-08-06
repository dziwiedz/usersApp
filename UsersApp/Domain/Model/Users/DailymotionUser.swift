//
//  DailymotionUser.swift
//  Domain
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

public struct DailyMotionUser: UserProtocol {
    public let username: String
    public let avatarUrl: String
    public let from: UserSource = .dailymotion
    
    public init(username: String, avatarUrl: String) {
        self.username = username
        self.avatarUrl = avatarUrl
    }
}
