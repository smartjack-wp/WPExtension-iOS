//
//  Array+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/22.
//

import UIKit

public extension Array {
    /**
     Array 의 element가 존재하는지 확인하기 위한 함수
     
     isEmpty의 반대값이며 조금 더 명시적인 코딩을 위해서 사용
     
     How
     ===
     if array.isNotEmpty {
        ...
     }
     
     TestCase
     ===
     ```
     sampleView.isNotEmpty == true
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var isNotEmpty: Bool { !isEmpty }
}
