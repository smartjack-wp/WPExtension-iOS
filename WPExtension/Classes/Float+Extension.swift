//
//  Float+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/20.
//

import Foundation

public extension Float {
    func commaInsertedString(until decimalPointCount: Int = 0) -> String? {
        guard decimalPointCount != 0 else {
            return Int(self).commaInsertedString
        }
        
        
        let valueString = String(self)
        let intAndDecimalSubStrings = valueString.split(separator: ".")
        
        guard let intString = Int(String(intAndDecimalSubStrings[0]))?.commaInsertedString else {
            return nil
        }
        
        if intAndDecimalSubStrings.count == 1 {
            
            return intString + ".0"
            
        } else if intAndDecimalSubStrings.count == 2 {
            var result = ""
            let decimalString = String(intAndDecimalSubStrings[1])
            var stringEndIndexOffset: Int {
                return decimalString.count > decimalPointCount ? decimalPointCount : decimalString.count
            }
            
            guard let integerDecimalValue = Int(decimalString[decimalString.startIndex..<decimalString.index(decimalString.startIndex, offsetBy: stringEndIndexOffset)]) else {
                return nil
            }
            
            result += intString
            result += "."
            if integerDecimalValue == 0 {
                result += String(integerDecimalValue)
            } else{
                result += String(decimalString[decimalString.startIndex..<decimalString.index(decimalString.startIndex, offsetBy: stringEndIndexOffset)])
            }
            
            return result
            
        } else {
            return nil
        }
    }
}
