//
//  GithubUser+Codable.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

extension GithubUser: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let username = try container.decode(String.self, forKey: .username)
        let avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        self = GithubUser(username: username, avatarUrl: avatarUrl)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.avatarUrl, forKey: .avatarUrl)
    }
    
    private enum CodingKeys: String, CodingKey {
        case username = "login"
        case avatarUrl = "avatar_ur"
    }
}
