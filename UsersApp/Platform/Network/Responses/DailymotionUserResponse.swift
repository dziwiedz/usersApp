//
//  DailymotionUserResponse.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

internal struct DailymotionUserResponse {
    let users: [DailyMotionUser]
}

extension DailymotionUserResponse: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let users = try container.decode([DailyMotionUser].self, forKey: .users)
        self = DailymotionUserResponse(users: users)
    }
    
    private enum CodingKeys: String, CodingKey {
        case users = "list"
    }
}
