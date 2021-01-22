//
//  ArrayExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class ArrayExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsNotEmpty() {
        var testArray: [String] = ["hello"]
        
        XCTAssertTrue(testArray.isNotEmpty)
        
        testArray.removeFirst()
        
        XCTAssertTrue(testArray.isEmpty)
        XCTAssertFalse(testArray.isNotEmpty)
    }

}
