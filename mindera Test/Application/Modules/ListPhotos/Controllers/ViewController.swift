//
//  ViewController.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK:  OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK:  PRIVATE VARS
    lazy var presenter: ListOfPhotosModule = {
        return ListOfPhotosPresenter(view: self)
    }()
    
    // MARK:  STATUS BAR
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    var photoItems:[Photo]?
    
    // MARK:  VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getPhotoList()
        registerNibsCell()
    }
    
    // MARK:  PRIVATE METHODS
    private func registerNibsCell() {
        let nibs = [PhotoGridCell.identifier]
        
        for cell in nibs {
            let nib = UINib.init(nibName: cell, bundle: nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: cell)
        }
    }

}

// MARK:  MVP EXTENSIONS
extension ViewController: ListOfPhotosInterfaces{
    func populatePhotoList(photoObject: PhotosObject) {
        photoItems = photoObject.photo
        collectionView.reloadData()
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = photoItems?.count else {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGridCell.identifier, for: indexPath) as? PhotoGridCell else {
            return UICollectionViewCell()
        }
        cell.tag = indexPath.row
        
        guard let id = photoItems?[indexPath.row].id else {
            return UICollectionViewCell()
        }
        
        if(cell.tag == indexPath.row){
            cell.populateImageCell(id: id)
        }
        
        return cell
    }
    
}
