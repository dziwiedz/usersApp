//
//  GetDailymotionUsersUseCaseMock.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain
@testable import Platform

final class GetDailymotionUsersUseCaseMock : Domain.GetDailyMotionUsersCase {
    
    var itemsToReturn: [DailyMotionUser]?
    var errorToReturn: Error?
    var sleepFor: UInt32?
    
    func getUsers(completion: @escaping (Error?, [DailyMotionUser]?) -> Void) {
        
        if let sleepFor = sleepFor {
            sleep(sleepFor)
        }
        
        if errorToReturn != nil {
            completion(errorToReturn,nil)
            return
        }
        completion(nil,itemsToReturn)
    }
}
