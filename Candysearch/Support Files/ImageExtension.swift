//
//  ImageExtension.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation
import UIKit


//attempt to cache image
//went with basic load instead

//private var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
//    func load(urlString: String) {
//        guard let url = URL(string: urlString) else {return}
//
//        image = nil
//
//        URLSession.shared.dataTask(with: url, completionHandler: {
//            (data, response, error) in
//            if error != nil {
//                print(error)
//                return
//            }
//
//            DispatchQueue.main.async {
//                guard let imageData = data else {return}
//                let imageToCache = UIImage(data: imageData)
//                imageCache.setObject(imageToCache!, forKey: urlString)
//                self.image = imageToCache
//            }
//            }).resume()
//    }
}

