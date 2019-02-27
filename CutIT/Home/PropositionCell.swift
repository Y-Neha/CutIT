//
//  PropositionCell.swift
//  CutIT
//
//  Created by Neha Yadav on 22/02/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit
import Cosmos

class PropositionCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var container: UIView!
    
    var proposition: Proposition! {
        didSet{
            name.text = proposition.name
            address.text = proposition.address
            ratingView.rating = proposition.rating
            poster.image = proposition.image
            ratingView.settings.fillMode = .precise
            ratingView.rating = proposition.rating
            ratingView.text = "(\(proposition.rating) ratings)"
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        container.layer.borderColor = UIColor(rgb: 0xE5ECED).cgColor
        container.layer.borderWidth = 1
        container.layer.cornerRadius = 5
        container.layer.shadowOffset = .init(width: 3, height: 1)
        container.layer.shadowColor = UIColor(rgb: 0xE5ECED).cgColor
        container.layer.shadowRadius = 3
        container.layer.shadowOpacity = 0.9
        poster.layer.cornerRadius = 5
        poster.clipsToBounds = true
    }
}
