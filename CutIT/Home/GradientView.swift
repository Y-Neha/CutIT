//
//  GradientView.swift
//  CutIT
//
//  Created by Neha Yadav on 22/02/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = .clear
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor(white: 255, alpha: 1).cgColor, UIColor(white: 255, alpha: 1).cgColor, UIColor(white: 255, alpha: 0.94).cgColor, UIColor(white: 255, alpha: 0).cgColor ].reversed()
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        layer.insertSublayer(gradient, at: 0)
    }
}
