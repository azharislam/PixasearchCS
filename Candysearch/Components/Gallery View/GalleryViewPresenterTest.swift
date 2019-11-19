//
//  GalleryViewPresenterTest.swift
//  CandysearchTests
//
//  Created by Azhar Islam on 19/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import XCTest
@testable import Candysearch

class GalleryViewPresenterTest: XCTestCase {
    
       private var presenter: GalleryViewPresenter!
       private var view: GalleryViewMock!
       private var controller: GalleryViewController!
    
    override func setUp() {
        view = GalleryViewMock()
        presenter = GalleryViewPresenter(controller: controller)
    }
    
    func test_viewDidLoad_success() {
        presenter.view = view
        presenter.viewDidLoad()

        XCTAssertEqual(view.title, "YOUR IMAGE SEARCH RESULTS")
    }
    
    func test_didSetTitle() {
        
    }


}


private class GalleryViewMock: GalleryView {
    
    var images: Image?
    let apiCaller = PixabayAPI()
    var imageCollection = [Hits]()
    var layout: UICollectionViewFlowLayout!
    var searchString = String()
    var title: String?
    var viewController: UIViewController?
    var isNavigation = false
    
    func reloadData() {}
    func setNavTitle(_ title: String) {self.title = title}
    func setNavigation() {self.isNavigation = true}
}

private class GalleryViewCellMock: ImageCellProtocol {
    func set(image: URL?) {
        
    }
    
    
    var images: Image?
    let apiCaller = PixabayAPI()
    var imageCollection = [Hits]()
    var layout: UICollectionViewFlowLayout!
    var searchString = String()
    var title: String?
    var viewController: UIViewController?
    var isNavigation = false
    
    func reloadData() {}
    func setNavTitle(_ title: String) {self.title = title}
    func setNavigation() {self.isNavigation = true}
}
