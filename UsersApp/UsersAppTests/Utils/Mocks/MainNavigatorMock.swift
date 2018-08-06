//
//  MainNavigatorMock.swift
//  UsersAppTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain
@testable import UsersApp


final class MainNavigatorMock: MainNavigating {
    
    var didInvokedToDetails: Bool = false
    
    func toDetails(of user: UserProtocol) {
        didInvokedToDetails = true
    }
    
    
}
