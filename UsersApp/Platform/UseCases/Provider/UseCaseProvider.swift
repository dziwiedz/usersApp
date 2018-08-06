//
//  UseCaseProvider.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCasesProvider {
    
    private let githubProvider: Domain.GetGithubUsersCaseProvider
    private let dailymotionProvider: Domain.GetDailyMotionUsersCaseProvider
    private let usersProvider : Domain.GetUsersCaseProvider
    
    
    public func provideGithubUsersProvider() -> Domain.GetGithubUsersCaseProvider {
        return githubProvider
    }
    
    public func provideDailyMotionUsersProvider() -> GetDailyMotionUsersCaseProvider {
        return dailymotionProvider
    }
    
    public func provideUserCaseProvider() -> GetUsersCaseProvider {
        return usersProvider
    }
    
    public init() {
        self.githubProvider = GetGithubUsersCaseProvider()
        self.dailymotionProvider = GetDailymotionUsersCaseProvider()
        self.usersProvider = UserUseCaseProvider(githubUsersUseCase: githubProvider.provideUseCase(),
                                                 dailyMotionUseCase: dailymotionProvider.provideUseCase())
    }
    
}
