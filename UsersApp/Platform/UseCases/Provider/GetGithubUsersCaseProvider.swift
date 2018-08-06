//
//  GithubUseCaseProvider.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

final class GetGithubUsersCaseProvider: Domain.GetGithubUsersCaseProvider {

    private let useCase: GetGithubUsersCase
    
    func provideUseCase() -> Domain.GetGithubUsersCase {
        return useCase
    }
    
    init() {
        let resource = GithubUserResource()
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration)
        let webService = WebService(session: urlSession)
        self.useCase = GetGithubUsersCase(resource: resource, webService: webService)
    }
    
}
