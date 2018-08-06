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
    
    init(resource: RequestableResource, webService: WebServicing) {
        self.useCase = GetDailyMotionUsersCase(resource: resource, webService: webService)
    }
    
}
