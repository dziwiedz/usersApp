//
//  GetUsersCase.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

internal final class GetUsersCase: Domain.GetUsersCase {
    
    private let githubUsersUseCase: Domain.GetGithubUsersCase
    private let dailyMotionUseCase: Domain.GetDailyMotionUsersCase
    private var lastError: Error?
    private var users: [UserProtocol]?
    
    func getUsers(completion: @escaping (Error?, [UserProtocol]?) -> Void) {
        users = []
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        githubUsersUseCase.getUsers { [weak self] (error, users) in
            self?.handleCompletion(error: error, users: users, dispatchGroup: dispatchGroup)
        }
        
        dispatchGroup.enter()
        dailyMotionUseCase.getUsers { [weak self] (error, users) in
            self?.handleCompletion(error: error, users: users, dispatchGroup: dispatchGroup)
        }
        
        dispatchGroup.notify(queue: DispatchQueue.global()) { [weak self] in
            completion(self?.lastError,self?.users)
        }
    }
    
    init(githubUsersUseCase: Domain.GetGithubUsersCase,
         dailyMotionUseCase: Domain.GetDailyMotionUsersCase) {
        self.githubUsersUseCase = githubUsersUseCase
        self.dailyMotionUseCase = dailyMotionUseCase
    }
    
    private func handleCompletion(error: Error?, users: [UserProtocol]?, dispatchGroup: DispatchGroup) {
        if error != nil {
            lastError = error
            dispatchGroup.leave()
            return
        }
        self.users?.append(contentsOf: users ?? [])
        dispatchGroup.leave()
    }
    
}
