//
//  GetDailyMotionUsersCase.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

internal final class GetDailyMotionUsersCase: Domain.GetDailyMotionUsersCase {
    
    private let resource: RequestableResource
    private let webService: WebServicing
    
    func getUsers(completion: @escaping (Error?, [DailyMotionUser]?) -> Void) {
        self.webService.makeRequest(for: resource) { (error: Error?, response: DailymotionUserResponse?) in
            completion(error,response?.users)
        }
    }
    
    internal init(resource: RequestableResource, webService: WebServicing) {
        self.resource = resource
        self.webService = webService
    }
}
