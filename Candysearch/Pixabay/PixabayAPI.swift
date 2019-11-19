//
//  PixabayAPI.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation

public enum Response: String {
    case key = "key"
    case q = "q"
    case imageType = "image_type"
    case photo = "photo"
}

protocol NetworkRequestManager: AnyObject {
    func request(searchTerms: String, completionHandler: @escaping () -> Void)
}

//tried to parse response as [Response : String]

class PixabayAPI {
    
    let apiURL = IdentifierExtension.Identifier.apiURL.rawValue
    let apiKey = IdentifierExtension.Identifier.apiKey.rawValue
    
    func imageSearchURL(searchTerm: String?) -> URL {
        guard let searchString = searchTerm else {
            return pixabayURL(jsonKey: [Response.q.rawValue : ""])
        }
        let searchParam = [Response.q.rawValue: searchString]
        return pixabayURL(jsonKey: searchParam)
    }
    
    
    func pixabayURL(jsonKey: [String:String]?) -> URL {
        var components = URLComponents(string: apiURL)
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            Response.key.rawValue: apiKey,
            Response.imageType.rawValue : Response.photo.rawValue
            ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = jsonKey {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components?.queryItems = queryItems
        
        return (components?.url)!
    }
}
