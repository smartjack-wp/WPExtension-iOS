//
//  UITextField+Extension.swift
//  WPExtension_Tests
//
//  Created by Hyeontae on 2021/01/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

public extension UITextField {
    /**
     자동완성, 첫번째 문자 대문자 등등 Keyboard에 덧붙여지는 기능들을 제외한다.
     
     How
     ===
     textField.setNeatKeyboard()
     
     TestCase
     ===
     ```
     textField.setNeatKeyboard()
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func setNeatKeyboard() {
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.smartDashesType = .no
        self.smartInsertDeleteType = .no
        self.smartQuotesType = .no
        self.spellCheckingType = .no
    }
}
