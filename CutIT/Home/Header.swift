//
//  Header.swift
//  CutIT
//
//  Created by Neha Yadav on 26/02/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

class Header: UIView {
    
    convenience init(frame: CGRect, title: String, detail: String) {
        self.init(frame: frame)
        let titleLabel = UILabel(frame: .init(x: 0, y: 0, width: 100, height: 18))
        titleLabel.font = UIFont.init(name: "SFUIText-Bold", size: 15)
        addSubview(titleLabel)
        titleLabel.textColor = UIColor(rgb: 0x273D52)
        titleLabel.text = title
        let detailLabel = UILabel(frame: .init(x: 100, y: 0, width: frame.width-100, height: 18))
        detailLabel.font = UIFont.init(name:"SFUIText-Regular", size:12)
        detailLabel.textColor = UIColor(rgb: 0x273D52)
        addSubview(detailLabel)
        detailLabel.text = detail
        detailLabel.textAlignment = .right
        backgroundColor = .white
    }
}
