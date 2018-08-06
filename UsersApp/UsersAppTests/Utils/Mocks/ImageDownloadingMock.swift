//
//  ImageDownloadingMock.swift
//  UsersAppTests
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit
@testable import UsersApp

final class ImageDownlaoderMock: ImageDownloading {
    
    var errorToReturn: Error?
    var imageToReturn: UIImage?
    var didInvokedDownloadImage: Bool = false
    
    func downloadImage(url: URL?, completion: @escaping (UIImage?, Error?) -> Void) {
        didInvokedDownloadImage = true
        if errorToReturn != nil {
            completion(nil,errorToReturn)
            return
        }
        completion(imageToReturn,nil)
    }
    
    
}
