//
//  ViewController.swift
//  Candysearch
//
//  Created by Azhar Islam on 17/11/2019.
//  Copyright © 2019 Azhar Islam. All rights reserved.
//

import UIKit

protocol GalleryView {
    func reloadData()
    func setNavTitle(_ title: String)
    func setNavigation()
}

class GalleryViewController: UIViewController {
    
    private var images: Image?
    private let apiCaller = PixabayAPI()
    private var imageCollection = [Hits]()
    private var presenter: GalleryPresenterProtocol?
    private var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var galleryCV: UICollectionView!
    var searchString = String()


    private lazy var viewPresenter: GalleryViewPresenter = {
        return GalleryViewPresenter(controller: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewPresenter.configureGalleryView()
        self.userSearchImages()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupFlowLayout()
    }
    
    private func userSearchImages() {
        request(searchTerms: searchString, completionHandler: {  [weak self] in
            guard let results = self?.imageCollection else {
                           print("error")
                           return
                       }
                       print("Number of images found: \(results.count)")
                       }
        )
    }
    
    func setupFlowLayout() {
        if layout == nil {
            let numberItemsPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 100
            let interItemSpacing: CGFloat = 5

            let width = (galleryCV.frame.width - (numberItemsPerRow - 1) * (interItemSpacing) / numberItemsPerRow)
            let height = width

        layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets.zero
        layout.scrollDirection = .horizontal

        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interItemSpacing
        galleryCV.setCollectionViewLayout(layout, animated: true)
        }
    }
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.hits.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? GalleryImageCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }
        guard let imageURL = imageCollection[indexPath.row].largeImageURL else {
            return UICollectionViewCell()
        }
        viewPresenter.configureGalleryCell(url: imageURL, cell: cell)
        return cell
    }
}

extension GalleryViewController: GalleryView {
    func reloadData() {
        galleryCV.reloadData()
    }
    
    func setNavTitle(_ title: String) {
       navigationItem.title = title
    }
    
    func setNavigation() {
        navigationController?.navigationBar.isHidden = false
    }
}

extension GalleryViewController: NetworkRequestManager {
    func request(searchTerms: String, completionHandler: @escaping () -> Void) {
         let url = apiCaller.imageSearchURL(searchTerm: searchTerms)
               let request = URLRequest(url: url)
               let task = session.dataTask(with: request) {
                   (data, response, error) -> Void in

                   if let jsonData = data {
                       do {
                           let decoder = JSONDecoder()
                           self.images = try decoder.decode(Image.self, from: jsonData)
                           if let imageHits = self.images?.hits {
                               self.imageCollection = imageHits
                           }
                       } catch let error {
                           print("Error creating JSON object: \(error)")
                       }
                   } else if let requestError = error {
                       print("Error fetching images: \(requestError)")
                   } else {
                       print("Unexpected error with the request")
                   }
                   DispatchQueue.main.sync {
                       completionHandler()
                    
                       self.galleryCV.reloadData()
                   }

               }
               task.resume()
           }
}
