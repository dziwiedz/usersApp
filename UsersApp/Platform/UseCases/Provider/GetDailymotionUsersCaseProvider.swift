//
//  DailymotionUseCaseProvider.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

final class GetDailymotionUsersCaseProvider: Domain.GetDailyMotionUsersCaseProvider {
    
    private let useCase: GetDailyMotionUsersCase
    
    func provideUseCase() -> Domain.GetDailyMotionUsersCase {
        return useCase
    }
    
    init() {
        let resource = DailymotionUserResource()
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration)
        let webService = WebService(session: urlSession)
        self.useCase = GetDailyMotionUsersCase(resource: resource, webService: webService)
    }
    
}
