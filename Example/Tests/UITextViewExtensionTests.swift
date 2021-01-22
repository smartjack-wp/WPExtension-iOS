//
//  UITextViewExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UITextViewExtensionTests: XCTestCase {
    
    var textView: UITextView!

    override func setUpWithError() throws {
        textView = UITextView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNeatKeyboard() {
        textView.setNeatKeyboard()
        
        XCTAssertTrue(textView.autocapitalizationType == .none &&
                        textView.autocorrectionType == .no &&
                        textView.smartDashesType == .no &&
                        textView.smartInsertDeleteType == .no &&
                        textView.smartQuotesType == .no &&
                        textView.spellCheckingType == .no)
    }

}
