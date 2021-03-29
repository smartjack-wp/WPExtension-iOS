//
//  UIColor+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/03/16.
//

import UIKit

public extension UIColor {
    /**
     hexValue 로 표현된 string 값을 UIColor 로 변환한다.
     
     - Parameter hexString: #rrggbb 혹은 #rrggbbaa로 표현되는 hexValue String
     - Returns: hex값을 변환한 UIColor
     
     hexString은 반드시 #을 prefix 로 가져야 한다.
     또한 #rrggbb || #rrggbbaa 형식을 갖춰야 하며, 이때 대/소문자는 구분하지 않아도 된다.
     
     How
     ===
     ```
     UIColor(hexString: "#rrggbb")
     UIColor(hexString: "#rrggbbaa")
     ```
     
     TestCase
     ===
     ```
     UIColor(hexString: "#AF231C")
     UIColor(hexString: "#485CC7")
     UIColor(hexString: "#0c0c0c32")
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.1
     
     Author : onemoon
     */
    convenience init?(hexString: String) {
        guard hexString.hasPrefix("#") else {
            return nil
        }
        
        let trimedString = hexString.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        guard let value = UInt32(trimedString, radix: 16) else {
            return nil
        }
        
        var r, g, b: CGFloat
        var a: CGFloat = 1.0

        if trimedString.count == 6 {
            r = CGFloat((value & 0xff0000) >> 16) / 255
            g = CGFloat((value & 0x00ff00) >> 8) / 255
            b = CGFloat((value & 0x0000ff)) / 255
        } else if trimedString.count == 8 {
            r = CGFloat((value & 0xff000000) >> 24) / 255
            g = CGFloat((value & 0x00ff0000) >> 16) / 255
            b = CGFloat((value & 0x0000ff00) >> 8) / 255
            a = CGFloat(value & 0x000000ff) / 100
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /**
     red green blue 값을 255 이내의 자연수로 표현하며, alpha는 100 이내의 자연수로 percent를 표현한다.
     
     - Parameter red: 빨간색 값
     - Parameter green: 초록색 값
     - Parameter blue: 파란색 값
     - Parameter alphaPercent: 알파 퍼센트 값
     - Returns: 값이 변환된 UIColor
     
     red green blue 값은 255 이내이며 256 이상이 되는 경우 nil이 리턴된다.
     alphaPercent의 경우 100이내이며 101 이상이 되는 경우 nil이 리턴된다.
     alphaPercent 는 defaultValue를 100을 가지고 있으며 생성시 생략이 가능하다.
     
     How
     ===
     ```
     UIColor(red: 100, green: 100, blue: 100)
     UIColor(red: 50, green: 50, blue: 50, alphaPercent: 50)
     ```
     TestCase
     ===
     ```
     // Good
     UIColor(red: 175, green: 35, blue: 28)
     UIColor(red: 72, green: 92, blue: 199)
     UIColor(red: 12, green: 12, blue: 12, alphaPercent: 50)
     // Bad
     UIColor(red: 300, green: 0, blue: 0) = nil
     UIColor(red: 0, green: 300, blue: 0) = nil
     UIColor(red: 0, green: 0, blue: 300) = nil
     UIColor(red: 0, green: 0, blue: 0, alpha: 101) = nil
     ```
     
     Additional Information
     ===
     Added Version : v1.0.1
     
     Author : onemoon
     */
    convenience init?(red: UInt, green: UInt, blue: UInt, alphaPercent: UInt = 100) {
        guard red <= 255, green <= 255, blue <= 255, alphaPercent <= 100 else {
            return nil
        }
        
        self.init(red: CGFloat(red) / 255,
                  green: CGFloat(green) / 255,
                  blue: CGFloat(blue) / 255,
                  alpha: CGFloat(alphaPercent) / 100)
    }
    
    /**
     UIColor의 hexValue가 표현된 String을 얻기 위한 함수
     
     - Parameter withAlpha: 알파값을 포함한 8자리 값으로 표현할 것인지 판단하는 값
     - Parameter uppercase: 대/소문자를 표현하는 값
     - Returns: #과 hexValue 가 표현된 값
     
     Discussion ...
     
     How
     ===
     ```
     color.hexString() = #rrggbb
     color.hexString(withAlpha: true) = #rrggbbaa
     color.hexString(uppercase: true) = #RRGGBB
     ```
     
     TestCase
     ===
     ```
     UIColor(red: 175, green: 35, blue: 28).hexString() = "#af231c"
     UIColor(red: 72, green: 92, blue: 199).hexString(uppercase: true) = "#485CC7"
     UIColor(red: 12, green: 12, blue: 12, alphaPercent: 50).hexString(withAlpha: true) = "#0c0c0c32"
     ```
     
     Additional Information
     ===
     Added Version : v1.0.1
     
     Author : onemoon
     */
    func hexString(withAlpha: Bool = false, uppercase: Bool = false) -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var resultString = "#"
        
        let redHexString = String(Int(red * 255), radix: 16, uppercase: uppercase)
        if redHexString.count == 1 { resultString += "0" }
        resultString += redHexString
        
        let greenHexString = String(Int(green * 255), radix: 16, uppercase: uppercase)
        if greenHexString.count == 1 { resultString += "0" }
        resultString += greenHexString
        
        let blueHexString = String(Int(blue * 255), radix: 16, uppercase: uppercase)
        if blueHexString.count == 1 { resultString += "0" }
        resultString += blueHexString
        
        if withAlpha {
            let alphaHexString = String(Int(alpha * 100), radix: 16, uppercase: uppercase)
            if alphaHexString.count == 1 { resultString += "0" }
            resultString += alphaHexString
        }
        
        return resultString
    }
}
