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
        if let value = Float(1234.5).commaInsertedString() {
            XCTAssertEqual(value, "1,234")
        } else {
            XCTFail("1 > nil")
        }
        
        if let value = Float(-1234.5).commaInsertedString() {
            XCTAssertEqual(value, "-1,234")
        } else {
            XCTFail("2 > nil")
        }
        
        if let value = Float(1234.56).commaInsertedString(until: 2) {
            XCTAssertEqual(value, "1,234.56")
        } else {
            XCTFail("3 > nil")
        }
        
        if let value = Float(1234.56).commaInsertedString(until: 4) {
            XCTAssertEqual(value, "1,234.56")
        } else {
            XCTFail("4 > nil")
        }
        
        if let value = Float(0.001).commaInsertedString(until: 2) {
            XCTAssertEqual(value, "0.0")
        } else {
            XCTFail("5 > nil")
        }
        
        if let value = Float(0.001).commaInsertedString(until: 4) {
            XCTAssertEqual(value, "0.001")
        } else {
            XCTFail("6 > nil")
        }
    }

}
