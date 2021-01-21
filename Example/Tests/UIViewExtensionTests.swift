//
//  UIViewExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UIViewExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIsVisible() {
        let sampleView = UIView()
        XCTAssertFalse(sampleView.isHidden)
        XCTAssertTrue(sampleView.isVisible)
    }
    
    func testShow() {
        let sampleView = UIView()
        sampleView.show()
        XCTAssertTrue(sampleView.isHidden == false)
    }
    
    func testHide() {
        let sampleView = UIView()
        sampleView.hide()
        XCTAssertTrue(sampleView.isHidden == true)
    }

    func testAddSubviews() {
        let aView = UIView()
        aView.tag = 1
        let bView = UIView()
        bView.tag = 2
        
        let parentView = UIView()
        parentView.addSubviews(aView, bView)
        
        var tags: [Int] = [1, 2]
        
        for view in parentView.subviews {
            for (index, tagNumber) in tags.enumerated() where view.tag == tagNumber {
                tags.remove(at: index)
            }
        }
        
        XCTAssertTrue(parentView.subviews.count == 2)
        XCTAssertTrue(tags.isEmpty)
    }
}
