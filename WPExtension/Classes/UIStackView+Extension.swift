//
//  UIStackView+Extension.swift
//  WPExtension
//
//  Created by Hyeontae on 2021/01/21.
//

import UIKit

public extension UIStackView {
    
    /**
     여러개의 뷰를 스택뷰의 arrangedSubview에 쉽게 추가할 수 있도록 만든 함수
     
     - Parameter views: 추가할 뷰들
     
     How
     ===
     parentView.addArrangedSubviews(aView, bView)
     or
     parentView.addArrangedSubviews(aView, bView, cView)
     
     TestCase
     ===
     ```
     parentView.addArrangedSubviews(aView, bView)
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
    /**
     
     스택뷰의 arrangedSubviews를 가린다.
     
     How
     ---
     parentView.hideAllArrangedSubviews()
     
     TestCase
     ---
     ```
     parentView.hideAllArrangedSubviews()
     
     ```
     
     Additional Information
     ---
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func hideAllArrangedSubviews() {
        for view in self.arrangedSubviews {
            view.isHidden = true
            
        }
    }
    
    /**
     스택뷰의 arrangedSubviews를 없앤다.
     
     How
     ===
     stacView.removeAllArrangedSubviews()
     
     TestCase
     ===
     ```
     stacView.removeAllArrangedSubviews()
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func removeAllArrangedSubviews() {
        for view in self.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    /**
     스택뷰 컨텐츠의 edges를 조절할 때 사용한다.
     
     - Parameter edges: content edges
     
     주의할 점은 edges를 조절하고 모든 arrangedSubview를 숨기는 경우 edges의 크기는 그대로 남아있다는 점이다.
     
     예를들어 vertical stackView 에서 UIEdges(top: 0, left: 50, bottom: 10, right: 0) 를 지정한 경우 내부의 모든 뷰를 숨기더라도 하단의 10만큼의 inset 은 그대로 남아있는 것을 확인할 수 있다.
     
     How
     ===
     stackView.setContentInset(someEdges)
     
     TestCase
     ===
     ```
     excluded
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func setContentInset(_ edges: UIEdgeInsets) {
        self.layoutMargins = edges
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    
    /**
     스택뷰의 백그라운드 컬러를 지정한다.
     
     - Parameter color: 백그라운드에 지정할 컬러
     
     iOS 14 이후에서는 stackview의 레이어가 CATransformLayer에서 CALayer 로 변경되었기 때문에 이전과 다르게 직접 backgroundColor를 지정할 수 있게 되었다.
     
     따라서 더 이상 백그라운드에 뷰를 채워서 넣지 않아도 상관 없어지므로 이런 분기처리를 한 메소드를 생성함
     
     How
     ===
     stackView.setBackgroundColor(someColor)
     
     TestCase
     ===
     ```
     exclued
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    func setBackgroundColor(_ color: UIColor) {
        if #available(iOS 14.0, *) {
            self.backgroundColor = color
        } else {
            addBackgroundColorView(color: color)
        }
    }
    
    /**
     iOS 14 이전에서 스택뷰의 백그라운드 컬러를 직접 지정할 수 없기 때문에 View를 추가하여 컬러가 지정된 것 처럼 보이게 한다.
     
     - Parameter color: 백그라운드에 지정할 컬러
     - Returns: 백그라운드 컬러가 지정된 View
     
     Summary 의 말처럼 iOS 14 전에는 stackView.backgroundColor 가 적용되지 않는다. 따라서 백그라운드 컬러가 설정된 것 처럼 보이게 하기 위해서 backgroundcolor 가 지정된 뷰를 추가한다.
     
     추가로 작업이 필요할 수 있기 때문에 추가된 뷰를 리턴한다.
     
     How
     ===
     stackView.addBackgroundColorView(.black)
     
     TestCase
     ===
     ```
     excluded
     
     ```
     
     Additional Information
     ===
     Added Version : v1.0.0
     
     Author : onemoon
     */
    @discardableResult
    func addBackgroundColorView(color: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.zPosition = -1
        
        self.addSubview(view)
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        return view
    }
}
