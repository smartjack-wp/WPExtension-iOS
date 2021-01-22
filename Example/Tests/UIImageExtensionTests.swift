//
//  UIImageExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UIImageExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImageBase64Encoding() {
        let image = UIImage(named: "Test")
        
        XCTAssertNil(image?.base64EncodedSourceString(compressionQuailty: -1))
        XCTAssertNil(image?.base64EncodedSourceString(compressionQuailty: 1.1))
        
        guard let encodedSourceString = image?.base64EncodedSourceString(compressionQuailty: 0.5) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert("data:image/png;base64,".count < encodedSourceString.count)
    }
}
