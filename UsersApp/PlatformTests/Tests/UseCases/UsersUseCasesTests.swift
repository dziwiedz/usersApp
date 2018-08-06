//
//  UsersUseCasesTests.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import XCTest
import Domain
@testable import Platform

class UsersUseCasesTests: XCTestCase {
    
    var usersUseCase: Platform.GetUsersCase!
    var githubUseCaseMock: GetGithubUsersUseCaseMock!
    var dailymotionUseCaseMock: GetDailymotionUsersUseCaseMock!
    var returnedError: Error?
    var returnedValues: [UserProtocol]?
    
    override func setUp() {
        super.setUp()
        githubUseCaseMock = GetGithubUsersUseCaseMock()
        dailymotionUseCaseMock = GetDailymotionUsersUseCaseMock()
        usersUseCase = GetUsersCase(githubUsersUseCase: githubUseCaseMock, dailyMotionUseCase: dailymotionUseCaseMock)
        returnedError = nil
        returnedValues = nil
    }
    
    override func tearDown() {
        githubUseCaseMock = nil
        dailymotionUseCaseMock = nil
        usersUseCase = nil
        returnedError = nil
        returnedValues = nil
        super.tearDown()
    }
    
    func testForReturningError() {
        let expectation = self.expectation(description: "Should return error")
        githubUseCaseMock.errorToReturn = TestError.first
        dailymotionUseCaseMock.itemsToReturn = UsersProvider.makeDailymotionUsers(howManny: 1)
        makeRequest(for: expectation)
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(returnedError)
        XCTAssert(returnedError! is TestError)
        
    }
    
    func testLastErrorForReturningErrorInBothCases() {
        let expectation = self.expectation(description: "Should return error")
        githubUseCaseMock.errorToReturn = TestError.first
        githubUseCaseMock.sleepFor = 2
        dailymotionUseCaseMock.errorToReturn = TestError.second
        makeRequest(for: expectation)
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(returnedError)
        guard let error = returnedError as? TestError
            else {
                XCTFail("Should be test error")
                return
        }
        XCTAssertEqual(error, TestError.first)
    }
    
    func testForReturingBothUseCasesUsers() {
        let githubUsers = 2
        let dailymotionUsers = 4
        let expectation = self.expectation(description: "Should return values")
        githubUseCaseMock.itemsToReturn = UsersProvider.makeGithubUsers(howManny: githubUsers)
        dailymotionUseCaseMock.itemsToReturn = UsersProvider.makeDailymotionUsers(howManny: dailymotionUsers)
        makeRequest(for: expectation)
        wait(for: [expectation], timeout: 5)
        XCTAssertNil(returnedError)
        guard let values = returnedValues
            else {
                XCTFail("Should have values")
                return
        }
        XCTAssertEqual(values.count, githubUsers + dailymotionUsers)
        XCTAssertEqual(values.filter{ $0.from == .github }.count, githubUsers)
        XCTAssertEqual(values.filter{ $0.from == .dailymotion }.count, dailymotionUsers)
    }
    
    private enum TestError: Error {
        case first, second
    }
    
    private func makeRequest(for expectation: XCTestExpectation) {
        usersUseCase.getUsers { [unowned self] (error, users) in
            self.returnedValues = users
            self.returnedError = error
            expectation.fulfill()
        }
    }
}
