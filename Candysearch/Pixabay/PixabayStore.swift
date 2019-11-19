//
//  PixabayStore.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation


final class ImageStore {
    
    var images: Image?
    let apiCall = PixabayAPI()
    
    private let session: URLSession = {
           let config = URLSessionConfiguration.default
           return URLSession(configuration: config)
       }()

       func fetchImages(searchTerms: String, completionHandler: @escaping () -> Void) {
           let url = apiCall.imageSearchURL(searchTerm: searchTerms)
           let request = URLRequest(url: url)
           let task = session.dataTask(with: request) {
               (data, response, error) -> Void in

               if let jsonData = data {
                   do {
                       let decoder = JSONDecoder()
                       self.images = try decoder.decode(Image.self, from: jsonData)
//                       if let imageHits = self.images?.hits {
//                           self.imageCollection = imageHits
//                       }
                   } catch let error {
                       print("Error creating JSON object: \(error)")
                   }
               } else if let requestError = error {
                   print("Error fetching images: \(requestError)")
               } else {
                   print("Unexpected error with the request")
               }
               DispatchQueue.main.sync {
                   completionHandler()
//                   self.galleryCV.reloadData()
               }

           }
           task.resume()
       }
}
