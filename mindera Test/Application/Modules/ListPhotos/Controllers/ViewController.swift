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
    
    var page:Int = 1
    
    // MARK:  STATUS BAR
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    var photoItems:[Photo] = []
    
    // MARK:  VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getPhotoList(page: page)
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
    func showLoader() {
        DispatchQueue.main.async {
            FullScreenLoader.sharedInstance.show()
        }
    }
    
    func hideLoader() {
        FullScreenLoader.sharedInstance.hide()
    }
    
    func showError(error: String) {
        alert(message: error)
    }
    
    func populatePhotoList(photoObject: PhotosObject) {
        photoItems += photoObject.photo
        collectionView.reloadData()
    }
}

// MARK:  COLLECTIONVIEW EXTENSIONS
extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGridCell.identifier, for: indexPath) as? PhotoGridCell else {
            return UICollectionViewCell()
        }
        cell.tag = indexPath.row
        
        guard let id = photoItems[indexPath.row].id else {
            return UICollectionViewCell()
        }
        
        DispatchQueue.main.async {
            if(cell.tag == indexPath.row){
                cell.populateImageCell(id: id)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(indexPath.row == photoItems.count-1){
            page += 1
            presenter.getPhotoList(page: page)
        }
    }
    
}
