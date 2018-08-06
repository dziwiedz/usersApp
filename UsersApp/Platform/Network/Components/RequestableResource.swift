//
//  Requesable.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

protocol RequestableResource {
    var path: String { get }
    var httpMethod: String { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
    var paramaterers: [String: String?]? { get }
    var request: URLRequest { get }
}

extension RequestableResource {
    var request: URLRequest? {
        let queryItems = paramaterers?.map{ URLQueryItem(name: $0.key, value: $0.value) }
        var urlComponenet = URLComponents(string: path)
        urlComponenet?.queryItems = queryItems
        guard let url = urlComponenet?.url
            else { return nil }
        var request = URLRequest(url: url)
        headers?.forEach{ request.addValue( $0.value, forHTTPHeaderField: $0.key) }
        request.httpBody = body
        request.httpMethod = httpMethod
        return request
    }
}
