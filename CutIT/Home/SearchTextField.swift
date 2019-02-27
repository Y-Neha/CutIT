//
//  UITextField+Extension.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

@IBDesignable class SearchTextField: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.borderColor = UIColor(r: 229, g: 236, b: 237).cgColor
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.shadowOffset = .init(width: 3, height: 1)
        layer.shadowColor = UIColor(r: 229, g: 236, b: 237).cgColor
        layer.masksToBounds = false
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.9
        
        
        let containerSize = CGSize(width: 36, height: 50)
        let imageSize = CGSize(width: 16, height: 50)
        
        leftViewMode = .always
        let leftContainer = UIView(frame: .init(origin: .zero, size: containerSize))
        let leftImage = UIImageView(image: #imageLiteral(resourceName: "search"))
        leftImage.frame = .init(origin: .init(x: 16, y: 0), size: imageSize)
        leftContainer.addSubview(leftImage)
        leftImage.contentMode = .left
        leftView = leftContainer
        
        rightViewMode = .always
        let rightContainer = UIView(frame: .init(origin: .zero, size: containerSize))
        let rightImage = UIImageView(image: #imageLiteral(resourceName: "navigate"))
        rightImage.frame = .init(origin: .zero, size: imageSize)
        rightContainer.addSubview(rightImage)
        rightImage.contentMode = .right
        rightView = rightContainer
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        let x: CGFloat = 255
        self.init(red: r/x, green: g/x, blue: b/x, alpha: a)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

