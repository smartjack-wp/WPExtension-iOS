//
//  Int+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/18.
//

import Foundation

public extension Int {
    /**
     
     숫자의 천의 단위에 맞춰서 콤마가 삽입된 스트링
     
     [ Int , Float 에 구현됨 ]
     
     How
     ===
     ```
     let value = 1234
     value.commaInsertedPerThousandString = "1,234"
     ```
     
     TestCase
     ===
     ```
     12345
     1234
     123
     0003
     0
     -1234
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var commaInsertedPerThousandString: String {
        
        var value = self
        
        let isNegativeValue: Bool = value < 0
        if isNegativeValue {
            value *= -1
        }
        
        var splitedValueArray: [Int] = []
        
        var isNeedSplit: Bool = false
        
        repeat {
            isNeedSplit = (value / 1000) != 0
            splitedValueArray.append(value % 1000)
            value /= 1000
        } while isNeedSplit
        
        splitedValueArray.reverse()
        
        var result: String = ""
        for splitedValueItem in splitedValueArray.enumerated() {
            result += String(splitedValueItem.element)
            if splitedValueItem.offset != splitedValueArray.count - 1 {
                result += ","
            }
        }
        
        if isNegativeValue {
            result = "-" + result
        }
        
        return result
    }
}
