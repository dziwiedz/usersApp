//
//  GetDailymotionUsersCase.swift
//  Domain
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

public protocol GetDailyMotionUsersCase {
    func getUsers(completion: @escaping (Error?,[DailyMotionUser]?) -> Void)
}
