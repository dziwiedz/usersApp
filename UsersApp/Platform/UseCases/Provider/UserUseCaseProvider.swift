//
//  UserUseCaseProvider.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

final class UserUseCaseProvider: Domain.GetUsersCaseProvider {    
    
    private let useCase: Domain.GetUsersCase
    
    func provideUseCase() -> Domain.GetUsersCase {
        return useCase
    }
    
    init(githubUsersUseCase: Domain.GetGithubUsersCase,
         dailyMotionUseCase: Domain.GetDailyMotionUsersCase) {
        self.useCase = GetUsersCase(githubUsersUseCase: githubUsersUseCase,
                                    dailyMotionUseCase: dailyMotionUseCase)
    }
    
}
