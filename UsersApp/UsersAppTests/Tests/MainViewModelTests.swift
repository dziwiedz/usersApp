//
//  MainViewModelTests.swift
//  UsersAppTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import XCTest
@testable import UsersApp

final class MainViewModelTests: XCTestCase {
    
    var viewModel: MainViewModel!
    var navigatorMock: MainNavigatorMock!
    var useCaseMock: GetUsersCaseMock!
    var imageDownloaderMock: ImageDownlaoderMock!
    
    override func setUp() {
        super.setUp()
        navigatorMock = MainNavigatorMock()
        useCaseMock = GetUsersCaseMock()
        imageDownloaderMock = ImageDownlaoderMock()
        viewModel = MainViewModel(usersProvider: useCaseMock,
            navigator: navigatorMock,
            imageDownlaoder: imageDownloaderMock)
    }
    
    func testIfFetchingData() {
        viewModel.fetchData()
        XCTAssert(useCaseMock.didInvokedFetching, "View model should invoke fetching")
    }
    
    func testIfReturnsCorrectUsers() {
        let expectation = self.expectation(description: "reloads values")
        let githubUsersCount = 2
        useCaseMock.usersToReturn? = UsersProvider.makeGithubUsers(howManny: githubUsersCount)
        viewModel.successHandler = {
            expectation.fulfill()
        }
        viewModel.fetchData()
        wait(for: [expectation], timeout: 100)
        viewModel.didTapOnItem(at: IndexPath(row: 0, section: 0))
        XCTAssert(navigatorMock.didInvokedToDetails)
    }
}
