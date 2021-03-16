//
//  UIColorExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/03/16.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class UIColorExtensionTests: XCTestCase {
    var PANTONE2350C: UIColor! // 175.35.28
    let PANTONE2350C_hexString = "#AF231C"
    var PANTONE2726C: UIColor! // 72.92.199
    let PANTONE2726C_hexString = "#485CC7"
    var alphaGray: UIColor! // 12.12.12 50%
    let alphaGray_hexString = "#0c0c0c32"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        PANTONE2350C = UIColor(red: 175 / 255.0, green: 35 / 255.0, blue: 28 / 255.0, alpha: 1)
        PANTONE2726C = UIColor(red: 72 / 255.0, green: 92 / 255.0, blue: 199 / 255.0, alpha: 1)
        alphaGray = UIColor(red: 12 / 255.0, green: 12 / 255.0, blue: 12 / 255.0, alpha: 0.5)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHexStringInitializer() {
        guard let generated2350Color = UIColor(hexString: PANTONE2350C_hexString),
              let generated2726Color = UIColor(hexString: PANTONE2726C_hexString),
              let generatedAlphaGrayColor = UIColor(hexString: alphaGray_hexString) else {
            XCTFail("Color initailizer with hexString Fail")
            return
        }
        XCTAssertEqual(generated2350Color, PANTONE2350C)
        XCTAssertEqual(generated2726Color, PANTONE2726C)
        XCTAssertEqual(generatedAlphaGrayColor, alphaGray)
    }
    
    func testRGBIntValueInitializer() {
        XCTAssertNil(UIColor(red: 300, green: 0, blue: 0))
        XCTAssertNil(UIColor(red: 0, green: 300, blue: 0))
        XCTAssertNil(UIColor(red: 0, green: 0, blue: 300))
        XCTAssertNil(UIColor(red: 0, green: 0, blue: 0, alpha: 101))
        
        guard let generated2350Color = UIColor(red: 175, green: 35, blue: 28),
              let generated2726Color = UIColor(red: 72, green: 92, blue: 199),
              let generatedAlphaGrayColor = UIColor(red: 12, green: 12, blue: 12, alphaPercent: 50) else {
            XCTFail("Color initailizer with red, green, blue, alpha (UInt) Fail")
            return
        }
        XCTAssertEqual(generated2350Color, PANTONE2350C)
        XCTAssertEqual(generated2726Color, PANTONE2726C)
        XCTAssertEqual(generatedAlphaGrayColor, alphaGray)
    }
    
    func testHexString() {
        XCTAssertEqual(PANTONE2350C.hexString(), PANTONE2350C_hexString.lowercased())
        XCTAssertEqual(PANTONE2726C.hexString(uppercase: true), PANTONE2726C_hexString)
        XCTAssertEqual(alphaGray.hexString(withAlpha: true), alphaGray_hexString)
    }
}
