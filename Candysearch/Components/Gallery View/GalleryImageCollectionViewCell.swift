//
//  GalleryImageCollectionViewCell.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import UIKit
import Foundation

protocol ImageCellProtocol: AnyObject {
    func set(image: URL?)
}

class GalleryImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension GalleryImageCollectionViewCell: ImageCellProtocol {
    func set(image: URL?) {
        guard let image = image else {return}
        galleryImage.load(url: image)
    }
}
