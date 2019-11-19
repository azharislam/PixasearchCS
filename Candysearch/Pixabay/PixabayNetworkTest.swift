//
//  PixabayNetworkTest.swift
//  CandysearchTests
//
//  Created by Azhar Islam on 19/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import XCTest
@testable import Candysearch

class PixabayNetworkTest: XCTestCase {

    var api = PixabayAPI()
    
    override func setUp() {
        api = PixabayAPI()
    }

    override func tearDown() {
        super.tearDown()
    }
       func testKeyUrlComponents() {
           
        let baseParams: [String : String] = [
               "key" : "13197033-03eec42c293d2323112b4cca6",
               "image_type" : "photo"
           ]
           
        XCTAssertNoThrow(api.pixabayURL(jsonKey: baseParams))
        XCTAssertNoThrow(try api.pixabayURL(jsonKey: baseParams))
    
           let request = try! api.pixabayURL(jsonKey: baseParams)
           
           let components = URLComponents(url: request, resolvingAgainstBaseURL: true)
           guard let keyItem = components?.queryItems?.first(where: { item in
               item.name == "key"
           }) else {
               XCTFail()
               return
           }
           
           XCTAssertEqual(keyItem.value, "13197033-03eec42c293d2323112b4cca6")
           
       }

}
