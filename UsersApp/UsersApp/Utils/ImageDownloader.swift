//
//  ImageDownloader.swift
//  UsersApp
//
//  Created by Łukasz Niedźwiedź on 06/08/2018.
//  Copyright © 2018 Niedzwiedz. All rights reserved.
//

import UIKit

final class ImageDownlaoder {

    private let imageCache: NSCache = NSCache<NSString, UIImage>()
    private let session: URLSession
    
    init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func downloadImage(url: URL?, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        guard let url = url else { return }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        }
        session.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                completion(nil, error)
                
            } else if let data = data, let image = UIImage(data: data) {
                self?.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image, nil)
            } else {
                completion(nil, error)
            }
        }.resume()
    }
}
