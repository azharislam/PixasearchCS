//
//  ImageExtension.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation
import UIKit

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
}

