//
//  MainNavigator.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit
import Domain

protocol MainNavigating: class {
    func toDetails(of user: UserProtocol )
}

final class MainNavigator : MainNavigating {
    
    private let navigationController: UINavigationController
    private let useCaseProvider: UseCasesProvider
    
    func toDetails(of user: UserProtocol) {
        
    }
    
    init(navigationController: UINavigationController,
         useCaseProvider: UseCasesProvider) {
        self.navigationController = navigationController
        self.useCaseProvider = useCaseProvider
    }
    
}
