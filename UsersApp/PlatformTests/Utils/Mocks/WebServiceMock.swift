//
//  WebServiceMock.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
@testable import Platform

class WebServiceMock: WebServicing {
    
    var fileName: String = ""
    var errorToReturn: Error?
    
    func makeRequest<T>(for resource: RequestableResource, completionHandler: @escaping (Error?, T?) -> Void) where T : Decodable {
        if errorToReturn != nil {
            completionHandler(errorToReturn, nil)
            return
        }
        let objects = JsonReader<T>.loadObject(fromJsonFileName: fileName)
        completionHandler(nil,objects)
        
    }
    
    
}
