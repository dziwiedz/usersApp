//
//  User.swift
//  Domain
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

public protocol UserProtocol {
    var username: String { get }
    var avatarUrl: String { get }
    var from: UserSource { get }
}
