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
    private let imageDownlaoder: ImageDownloading
    
    func toDetails(of user: UserProtocol) {
        let controller = DetailViewController()
        controller.user = user
        controller.imageDownloader = imageDownlaoder
        navigationController.pushViewController(controller, animated: true)
    }
    
    init(navigationController: UINavigationController,
         useCaseProvider: UseCasesProvider,
         imageDownloader: ImageDownloading) {
        self.navigationController = navigationController
        self.useCaseProvider = useCaseProvider
        self.imageDownlaoder = imageDownloader
    }
    
}
