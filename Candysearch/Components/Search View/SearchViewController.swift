//
//  SearchViewController.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import Foundation
import UIKit

protocol SearchView {
    func setButtonTitle(_ title: String)
    func setNavigation()
    func setLogo(image: UIImage)
    func setSearchRequest(term: String)
}

class SearchViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchField: UITextField!
    var didPressButton: (() -> Void)?
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
    
    
    @IBAction func searchPressed(_ sender: Any) {
        if searchField.text != "" {
            performSegue(withIdentifier: IdentifierExtension.Identifier.searchSegue.rawValue, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let galleryViewController = segue.destination as? GalleryViewController {
        guard let searchText = searchField.text else {return}
        galleryViewController.searchString = searchText
        }
    }
}

extension SearchViewController: SearchView {
    func setLogo(image: UIImage) {
        self.logo.image = image
    }
    
    func setButtonTitle(_ title: String) {
        self.searchButton.titleLabel?.text = title
    }
    
    func setNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setSearchRequest(term: String) {
        self.searchField.text = term
    }
}


