//
//  BaseView.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/19.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    static let recommandPosterImageSpacing = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    func setConstaints() { }
    
    func setGradient(color1: UIColor, color2: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor]
        
        gradient.locations = [0.0, 1.0]
        
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        gradient.frame = bounds
//        gradient.cornerRadius = 35
        layer.addSublayer(gradient)
    }
}

