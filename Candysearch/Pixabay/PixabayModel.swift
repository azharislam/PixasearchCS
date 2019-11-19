//
//  PixabayModel.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation

struct Hits: Decodable {
    let id: Int
    let type: String
    let tags: String
    let user: String
    let user_id: Int
    let pageURL: URL
    let previewURL: URL
    let previewHeight: Int
    let previewWidth: Int
    let webformatURL: URL
    let webformatHeight: Int
    let webformatWidth: Int
    let largeImageURL: URL?
    let imageHeight: Int
    let imageWidth: Int
}

struct Image: Decodable {
    let hits: [Hits]
}

struct Images: Decodable {
    var id: Int
    var largeImageURL: URL
    var previewURL: URL
}
