//
//  GetUsersUseCaseMock.swift
//  UsersAppTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

final class GetUsersCaseMock: GetUsersCase {
    var usersToReturn: [UserProtocol]? = []
    var errorToReturn: Error?
    var didInvokedFetching: Bool = false
    
    func getUsers(completion: @escaping (Error?, [UserProtocol]?) -> Void) {
        didInvokedFetching = true
        DispatchQueue.global().async { [unowned self] in
            if self.errorToReturn != nil {
                completion(self.errorToReturn,nil)
                return
            }
            completion(nil,self.usersToReturn)
        }

    }
    
    
}
