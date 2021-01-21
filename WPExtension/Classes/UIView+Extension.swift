//
//  UIView+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/21.
//

import UIKit

public extension UIView {
    /**
     뷰가 보이는 상태인지 확인하기 위한 property
     
     isHidden의 반대값이며 조금 더 명시적인 코딩을 위해서 사용
     
     How
     ---
     if view.isVisible {
        ...
     }
     
     TestCase
     ---
     ```
     sampleView.isVisible == true
     
     ```
     
     Additional Information
     ---
     Added Version : v1.0.0
     
     Author : onemoon
     */
    var isVisible: Bool { !isHidden }
    
    /**
     뷰를 보여지는 상태 ( isHidden = false ) 로 만든다.
     
     view.isHidden = false 대신에 조금 더 명시적이고 간단하게 사용하도록 한다.
     
     How
     ---
     view.show()
     
     TestCase
     ---
     ```
     view.show()
     
     ```
     
     Additional Information
     ---
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func show() {
        self.isHidden = false
    }
    
    /**
     뷰를 가려지는 상태 ( isHidden = true ) 로 만든다.
     
     view.isHidden = true 대신에 조금 더 명시적이고 간단하게 사용하도록 한다.
     
     How
     ---
     view.hide()
     
     TestCase
     ---
     ```
     view.show()
     view.isHidden = false
     
     ```
     
     Additional Information
     ---
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func hide() {
        self.isHidden = true
    }
    
    /**
     여러개의 뷰를 쉽게 추가할 수 있도록 만든 함수
     
     How
     ---
     parentView.addSubviews(aView, bView)
     or
     parentView.addSubviews(aView, bView, cView)
     
     TestCase
     ---
     ```
     parentView.addSubviews(aView, bView)
     
     ```
     
     Additional Information
     ---
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}

