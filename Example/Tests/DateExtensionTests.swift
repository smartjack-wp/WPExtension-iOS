//
//  DateExtensionTests.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/26.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    var nowDate: Date!
    
    override func setUpWithError() throws {
        nowDate = Date()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConvenienceInitPatternedString() {
        XCTAssertNotNil(Date("2020-12-07T03:19:09.000Z", dateFormat: .serverDate))
        XCTAssertNotNil(Date("2020-12-07", dateFormat: "yyyy-MM-dd"))
        XCTAssertNil(Date("not date", dateFormat: .serverDate))
        XCTAssertNil(Date(nil, dateFormat: .serverDate))
    }
    
    func testConvenienceInitWithCoponents() {
        XCTAssertNotNil(Date(year: 2021, month: 1, day: 26))
        XCTAssertNotNil(Date(year: 2021, month: 1, day: 26, hour: 3, minute: 30))
        
        let testDate = Date(year: 2021, month: 1, day: 26, hour: 3, minute: 30, second: 30)
        
        if let testDate = testDate {
            XCTAssertEqual(testDate.formattedString(.dotDate), "2021.01.26")
            XCTAssertEqual(testDate.formattedString(.dotDateUntilMinute), "2021.01.26 03:30")
            XCTAssertEqual(testDate.formattedString(.dotDateUntilSecond), "2021.01.26 03:30:30")
            
            XCTAssertEqual(testDate.formattedString(.dashDate), "2021-01-26")
            XCTAssertEqual(testDate.formattedString(.dashDateUntilMinute), "2021-01-26 03:30")
            XCTAssertEqual(testDate.formattedString(.dashDateUntilSecond), "2021-01-26 03:30:30")
            
            XCTAssertEqual(testDate.formattedString("yyyy-MM-dd"), "2021-01-26")
        } else {
            XCTFail("Date initializer Problem")
        }
    }
    
    func testPatternizedString() {
        if let testDate = Date(year: 2021, month: 1, day: 27) {
            XCTAssertEqual(testDate.formattedString(.dotDate), "2021.01.27")
        } else {
            XCTFail("Date initializer Problem")
        }
        
    }
    
    func testIsToday() {
        XCTAssertTrue(nowDate.isToday)
        if let testDate = Date(year: 2021, month: 1, day: 27) {
            XCTAssertFalse(testDate.isToday)
        } else {
            XCTFail("Date initializer Problem")
        }
    }
    
    func testYear() {
        if let testDate = Date(year: 2021, month: 1, day: 27) {
            XCTAssertEqual(testDate.year, 2021)
        } else {
            XCTFail("Date initializer Problem")
        }
    }
    
    func testMonth() {
        if let testDate = Date(year: 2021, month: 1, day: 27) {
            XCTAssertEqual(testDate.month, 1)
        } else {
            XCTFail("Date initializer Problem")
        }
    }
    
    func testDay() {
        if let testDate = Date(year: 2021, month: 1, day: 27) {
            XCTAssertEqual(testDate.day, 27)
        } else {
            XCTFail("Date initializer Problem")
        }
    }
}
