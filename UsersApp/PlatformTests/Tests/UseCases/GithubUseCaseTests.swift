//
//  GithubUseCaseTests.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import XCTest
import Domain
@testable import Platform

class GithubUseCaseTests: XCTestCase {
    
    var useCase: Platform.GetGithubUsersCase!
    var webServiceMock: WebServiceMock!
    let resource = GithubUserResource()
    
    
    override func setUp() {
        super.setUp()
        self.webServiceMock = WebServiceMock()
        self.webServiceMock.fileName = "GithubUsersResponse"
        self.useCase = GetGithubUsersCase(resource: resource, webService: webServiceMock)
    }
    
    override func tearDown() {
        self.useCase = nil
        self.webServiceMock = nil
        super.tearDown()
    }
    
    func testReturningValues() {
        let expectation = self.expectation(description: "should return values")
        var returendUsers: [GithubUser]?
        var returnedError: Error?
        useCase.getUsers { (error, users) in
            returendUsers = users
            returnedError = error
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(returendUsers)
        XCTAssertNil(returnedError)
        XCTAssertGreaterThan(returendUsers!.count, 0)
    }
    
    func testReturningErrer() {
        let expectation = self.expectation(description: "should return values")
        var returendUsers: [GithubUser]?
        var returnedError: Error?
        webServiceMock.errorToReturn = TestError()
        useCase.getUsers { (error, users) in
            returendUsers = users
            returnedError = error
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(returnedError)
        XCTAssertNil(returendUsers)
    }
    
    private struct TestError: Error {
    }
}

