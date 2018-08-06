//
//  WebService.swift
//  Platform
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation

internal protocol WebServicing {
    func makeRequest<T: Decodable>(for resource: RequestableResource, completionHandler: @escaping (Error?, T?) -> Void)
}

internal final class WebService {
    private let session: URLSession
    
    internal init(session: URLSession) {
        self.session = session
    }
    
    func makeRequest<T: Decodable>(for resource: RequestableResource, completionHandler: @escaping (Error?, T?) -> Void) {
        session.dataTask(with: resource.request) { (data, response, error) in
            if error != nil {
                completionHandler(error, nil)
                return
            }
            guard let data = data,
                let object = try? JSONDecoder().decode(T.self, from: data)
                else {
                    completionHandler(nil,nil)
                    return
            }
            completionHandler(nil,object)
        }.resume()
    }
}
