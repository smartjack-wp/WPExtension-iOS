//
//  Float+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/20.
//

import Foundation

public extension Float {
    /**
     
     숫자의 천의 단위에 맞춰서 콤마가 삽입된 스트링
     
     - Parameter decimalPointCount: 소수점 아래 나타내고 싶은 자리수
     - Returns: 콤마가 삽인된 스트링
     
     [ Int , Float 에 구현됨 ]
     
     소수점 아래자리의 경우 until 로 지정한 자리수 중에 마지막이 0 으로 끝나는 수는 0이 자연스럽게 제거되어 자연스럽게 보이도록 하였다. 예를 들어서 1.0002 (until: 2) 인 경우 1.0 으로 변경된다.
     
     만약 제대로 값이 도출되지 않는 경우는 빈 스트링이 리턴된다.
     
     How
     ===
     ```
     let value = 1234.56
     value.commaInsertedPerThousandString(until: 2) => "1,234.56"
     ```
     
     TestCase
     ===
     ```
     1 ()
     1 (until: 2)
     -1234.5 ()
     1234.56 (until: 2)
     1234.56 (until: 4)
     0.001 (until: 2)
     0.001 (until: 4)
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func commaInsertedPerThousandString(until decimalPointCount: UInt = 0) -> String {
        guard decimalPointCount != 0 else { return Int(self).commaInsertedPerThousandString }
        
        let valueString = String(self)
        let intAndDecimalSubStrings = valueString.split(separator: ".")
        
        guard let intString = Int(String(intAndDecimalSubStrings[0]))?.commaInsertedPerThousandString, intAndDecimalSubStrings.count == 2 else {
            return ""
        }
        
        var result = ""
        let decimalString = String(intAndDecimalSubStrings[1])
        var stringEndIndexOffset: Int {
            return decimalString.count > decimalPointCount ? Int(decimalPointCount) : decimalString.count
        }
        
        result += intString
        result += "."
        
        let integerDecimalValue = Int(decimalString[decimalString.startIndex..<decimalString.index(decimalString.startIndex, offsetBy: stringEndIndexOffset)]) ?? 0
        
        if integerDecimalValue == 0 {
            result += String(integerDecimalValue)
        } else{
            result += String(decimalString[decimalString.startIndex..<decimalString.index(decimalString.startIndex, offsetBy: stringEndIndexOffset)])
        }
        
        return result
    }
}
