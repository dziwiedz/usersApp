//
//  MappingTests.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import XCTest
import Domain
@testable import Platform

class MappingTests: XCTestCase {
    
    func testGitHubUserMappingFromJson() {
        let data = JsonReader<GithubUser>.loadObjectData(fromJsonFileName: "GithubUser")
        guard let user = try? JSONDecoder().decode(GithubUser.self, from: data)
            else {
                XCTFail("Parse error")
                return
        }
        XCTAssertEqual(user.avatarUrl, "https://avatars0.githubusercontent.com/u/1?v=4")
        XCTAssertEqual(user.username, "mojombo")
        XCTAssertEqual(user.from, .github)
    }
    
    func testDailymotionUserMappingFromJson() {
        let data = JsonReader<DailyMotionUser>.loadObjectData(fromJsonFileName: "DailyMotionUser")
        guard let user = try? JSONDecoder().decode(DailyMotionUser.self, from: data)
            else {
                XCTFail("Parse error")
                return
        }
        XCTAssertEqual(user.avatarUrl, "http://s1.dmcdn.net/AVM/360x360-png/iC2.jpg")
        XCTAssertEqual(user.username, "abrahamrodrig7311")
        XCTAssertEqual(user.from, .dailymotion)
    }
    
}
