//
//  GithubUser+RequestableResource.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
import Domain

internal struct DailymotionUserResource: GetRequestResource {
    var path: String = ApiRouter.dailymotionBaseUrl + "/users"
    var headers: [String : String]?
    var paramaterers: [String : String?]? = [
        "fields": "avatar_360_url,username"
    ]
}
