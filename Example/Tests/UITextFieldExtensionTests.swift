//
//  UITextFieldExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UITextFieldExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNeatKeyboard() {
        let textfield = UITextField()
        textfield.setNeatKeyboard()
        
        XCTAssertTrue(textfield.autocapitalizationType == .none &&
                        textfield.autocorrectionType == .no &&
                        textfield.smartDashesType == .no &&
                        textfield.smartInsertDeleteType == .no &&
                        textfield.smartQuotesType == .no &&
                        textfield.spellCheckingType == .no)
    }
}
