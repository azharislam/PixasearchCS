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

    var pixabayAPI = PixabayAPI()
    
    override func setUp() {

    }

    override func tearDown() {
        super.tearDown()
    }
       func testKeyUrlComponents() {
           
           let baseParams: [PixabayAPI.Keys: String] = [
               .q :  "",
               .editors_choice : "true",
               .category: ""
           ]
           
           XCTAssertNoThrow(try PixaBayAPI.buildRequestURL(with: params))
    
           let request = try! PixaBayAPI.buildRequestURL(with: params)
           
           let components = URLComponents(url: request, resolvingAgainstBaseURL: true)
           guard let key_item = components?.queryItems?.first(where: { item in
               item.name == PixaBayAPI.Keys.key.rawValue
           }) else {
               XCTFail()
               return
           }
           
           XCTAssertEqual(key_item.value, "9186145-a30a2be1c35b6d8267cab481e")
           
       }

}
