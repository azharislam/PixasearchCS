//
//  GalleryViewPresenter.swift
//  Candysearch
//
//  Created by Azhar Islam on 18/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation
import UIKit

enum StringHolder: String {
    case title = "YOUR IMAGE SEARCH RESULTS"
}

protocol GalleryPresenterProtocol {
    var  view: GalleryView? { get }
    func attachView(view: GalleryView)
    func viewDidLoad()
    func configureGalleryView()
    func configureGalleryCell(url: URL, cell: ImageCellProtocol)
}

class GalleryViewPresenter {
    private weak var controller: GalleryViewController?
    internal var view: GalleryView?


    init (controller: GalleryViewController) {
        self.controller = controller
    }
}

extension GalleryViewPresenter: GalleryPresenterProtocol {
    
    func attachView(view: GalleryView) {
        self.view = view
    }
    
    func configureGalleryCell(url: URL, cell: ImageCellProtocol) {
        cell.set(image: url)
    }
    
    func configureGalleryView() {
        let galleryViewCell = IdentifierExtension.Identifier.galleryViewCell.rawValue
        let photoCell = IdentifierExtension.Identifier.photoCell.rawValue
        let nib = UINib(nibName: galleryViewCell, bundle: nil)
        controller?.galleryCV.register(nib, forCellWithReuseIdentifier: photoCell)
    }

    func viewDidLoad() {
        let title = StringHolder.title.rawValue
        view?.setNavTitle(title)
    }
}
