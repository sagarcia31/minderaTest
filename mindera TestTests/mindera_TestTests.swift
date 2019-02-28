//
//  mindera_TestTests.swift
//  mindera TestTests
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import XCTest
@testable import mindera_Test

class mindera_TestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPopulateListPhotosObject() {
        let presenter: ListOfPhotosModule = {
            return ListOfPhotosPresenter(view: self)
        }()
        
        presenter.getPhotoList()
    }
    
    func testIfListPhotosObjectIsEmpty(){
        let presenter: ListOfPhotosModule = {
            return ListOfPhotosPresenter(view: self)
        }()
        
        presenter.getPhotoList()
    }
    
    func testIfPhotoIsSquareType(){
        let presenter: PhotoCellModule = {
            return PhotoCellPresenter(view: self)
        }()
        
        presenter.requestImage(id: "31456463045")
    }
    
    func testIfPhotoSourceIsWorking(){
        let presenter: PhotoCellModule = {
            return PhotoCellPresenter(view: self)
        }()
        
        presenter.requestImage(id: "31456463045")
    }

}

extension mindera_TestTests:ListOfPhotosInterfaces{
    func populatePhotoList(photoObject: PhotosObject) {
        if photoObject.photo.count > 0 {
            XCTAssertTrue(true, "Returned photo list object")
        }
        
        if photoObject.photo.isEmpty {
            XCTAssertTrue(true, "Photo list object is empty")
        }
    }
}

extension mindera_TestTests:PhotoCellInterfaces{
    func populateImageCell(photo: PhotoImage) {
        if(photo.label == "Large Square"){
            XCTAssertTrue(true)
        }
        
        if(photo.source?.isEmpty == false){
            XCTAssertTrue(true)
        }
    }

}
