//
//  UIStackViewExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UIStackViewExtensionTests: XCTestCase {
    
    var aView: UIView!
    var bView: UIView!
    var stackView: UIStackView!

    override func setUpWithError() throws {
        aView = UIView()
        bView = UIView()
        stackView = UIStackView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddArrangedSubviews() {
        stackView.addArrangedSubviews(aView, bView)
        
        XCTAssertTrue(stackView.arrangedSubviews.count == 2)
        
        var isContainOnlyTwoView: Bool = true
        for view in stackView.arrangedSubviews where !(view == aView || view == bView){
            isContainOnlyTwoView = false
        }
        
        XCTAssertTrue(isContainOnlyTwoView)
    }
    
    func testHideAllArrangedSubviews() {
        stackView.addArrangedSubviews(aView, bView)
        stackView.hideAllArrangedSubviews()
        
        var result: Bool {
            guard stackView.arrangedSubviews.count == 2 else { return false }
            for arrangedView in stackView.arrangedSubviews where arrangedView.isVisible {
                return false
            }
            return true
        }
        
        XCTAssertTrue(result)
    }
    
    func testRemoveAllArrangedSubviews() {
        stackView.addArrangedSubviews(aView, bView)
        stackView.removeAllArrangedSubviews()
        
        XCTAssertTrue(stackView.arrangedSubviews.count == 0)
    }
    
    func testContentInset() throws {
        stackView.setContentInset(.zero)
        try XCTSkipIf(true, "UI Test")
    }
    
    func testBackgroundColor() throws {
        stackView.setBackgroundColor(.blue)
        try XCTSkipIf(true, "UI Test")
    }
    
    func testBackgroundView() {
        let backgroundView = stackView.addBackgroundColorView(color: .blue)
        XCTAssertTrue(backgroundView.backgroundColor == UIColor.blue)
    }
}
