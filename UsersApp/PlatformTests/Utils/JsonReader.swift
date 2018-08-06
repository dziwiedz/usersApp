//
//  JsonReader.swift
//  PlatformTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import Foundation
final class JsonReader<T: Decodable> {
    static func loadObjectData(fromJsonFileName fileName: String) -> Data {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
        return try! Data(contentsOf: URL(fileURLWithPath: filePath!), options: .mappedIfSafe)
    }
    
    static func loadObject(fromJsonFileName fileName: String) -> T {
        let data = loadObjectData(fromJsonFileName: fileName)
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
