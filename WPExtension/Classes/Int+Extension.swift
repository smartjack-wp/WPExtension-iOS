//
//  Int+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/18.
//

import Foundation

public extension Int {
    var commaInsertedString: String {
        
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
