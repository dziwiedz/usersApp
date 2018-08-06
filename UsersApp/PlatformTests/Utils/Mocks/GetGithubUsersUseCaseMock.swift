//
//  GetGithubUsersUseCaseMock.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain
@testable import Platform

final class GetGithubUsersUseCaseMock : Domain.GetGithubUsersCase {
    
    var itemsToReturn: [GithubUser]?
    var errorToReturn: Error?
    var sleepFor: UInt32?
    
    func getUsers(completion: @escaping (Error?, [GithubUser]?) -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let sleepFor = self?.sleepFor {
                sleep(sleepFor)
            }
            if self?.errorToReturn != nil {
                completion(self?.errorToReturn,nil)
                return
            }
            completion(nil,self?.itemsToReturn)
        }

    }
}
