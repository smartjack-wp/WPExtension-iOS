//
//  FloatExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/20.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class FloatExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCommaInsertedString() {
        
        XCTAssertEqual(Float(1).commaInsertedString(), "1")

        XCTAssertEqual(Float(1).commaInsertedString(until: 2), "1.0")

        XCTAssertEqual(Float(-1234.5).commaInsertedString(), "-1,234")

        XCTAssertEqual(Float(1234.56).commaInsertedString(until: 2), "1,234.56")

        XCTAssertEqual(Float(1234.56).commaInsertedString(until: 4), "1,234.56")

        XCTAssertEqual(Float(0.001).commaInsertedString(until: 2), "0.0")

        XCTAssertEqual(Float(0.001).commaInsertedString(until: 4), "0.001")
    }

}
