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
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:  PRIVATE VARS
    lazy var presenter: ListOfPhotosPresenter = {
        return ListOfPhotosPresenter(view: self)
    }()
    
    var photoItems:[Photo]?
    
    // MARK:  VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getPhotoList()
        setupTableView()
    }
    
    // MARK:  PRIVATE METHODS
    func setupTableView() {
        registerNibsCell()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 180
        tableView.reloadData()
    }
    
    private func registerNibsCell() {
        let nibs = [PhotoCell.identifier]
        
        for cell in nibs {
            let nib = UINib.init(nibName: cell, bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: cell)
        }
    }
}

// MARK:  MVP EXTENSIONS
extension ViewController: ListOfPhotosInterfaces{
    func populatePhotoList(photoObject: PhotosObject) {
        photoItems = photoObject.listPhotos
        tableView.reloadData()
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = photoItems?.count else {
            return 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
            
            return UITableViewCell()
        }
        
        return cell
    }
}
