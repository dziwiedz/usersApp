//
//  DailymotionUser+RequestableResource.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

internal struct GithubUserResource: GetRequestResource {
    var path: String = ApiRouter.githubBaseUrl + "/users"
    var headers: [String : String]? = nil
    var paramaterers: [String : String?]? = nil
}
