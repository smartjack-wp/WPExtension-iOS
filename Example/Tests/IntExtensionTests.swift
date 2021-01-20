//
//  IntExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/20.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class IntExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCommaInsertedString() {
        XCTAssertEqual(12345.commaInsertedString, "12,345")
        XCTAssertEqual(1234.commaInsertedString, "1,234")
        XCTAssertEqual(123.commaInsertedString, "123")
        XCTAssertEqual(0003.commaInsertedString, "3")
        XCTAssertEqual(0.commaInsertedString, "0")
        XCTAssertEqual((-1234).commaInsertedString, "-1,234", "negative value")
    }
}
