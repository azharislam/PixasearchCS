//
//  SearchViewPresenter.swift
//  Candysearch
//
//  Created by Azhar Islam on 18/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation
import UIKit

enum Constants: String {
    case search = "Search"
    case logo = "candyspace.logo"
}

protocol SearchPresenterProtocol {
    var view: SearchView? { get }
    func attachView(view: SearchView)
    func set(buttonTitle: String)
    func set(imageView: UIImage)
}

class SearchViewPresenter {
    private weak var controller: SearchViewController?
    internal var view: SearchView?
    
    
    init (controller: SearchViewController) {
        self.controller = controller
    }
}

extension SearchViewPresenter: SearchPresenterProtocol {
    func attachView(view: SearchView) {
        self.view = view
    }
    
    func set(buttonTitle: String) {
        view?.setButtonTitle(Constants.search.rawValue)
    }
    
    func set(imageView: UIImage) {
        let imageName = Constants.logo.rawValue
        if let logo = UIImage(named: imageName) {
            view?.setLogo(image: logo)
        }
    }
}
