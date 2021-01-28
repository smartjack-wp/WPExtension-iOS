//
//  UIImage+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/22.
//

import UIKit

public extension UIImage {
    /**
     이미지를 base64 encoding된 텍스트를 포함한 소스 텍스트로 변환한다.
     
     - Parameter params: 이미지 압축 비율
     - Returns: 소스텍스트가 포함된 스트링
     
     이미지 압축 비율은 0부터 1까지 가능하며 낮을수록 화질이 안좋아진다.
     
     결과값은 아래와 같이 도출된다.
     
     ```
     "data:image/png;base64, ...(image)..."
     ```
     
     How
     ===
     image.base64EncodedSourceString(compressionQuailty: 0.7)
     
     TestCase
     ===
     ```
     image.base64EncodedSourceString(compressionQuailty: 0.7)
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func base64EncodedSourceString(compressionQuailty: CGFloat) -> String? {
        guard compressionQuailty > 0, compressionQuailty <= 1, let imageData = UIImageJPEGRepresentation(self, compressionQuailty) else { return nil }
        return "data:image/png;base64,\(imageData.base64EncodedString(options: .lineLength64Characters))"
    }
}
