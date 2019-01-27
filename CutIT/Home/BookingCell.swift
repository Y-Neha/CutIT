//
//  BookingCell.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell {
	
	@IBOutlet weak var container: UIView!
	@IBOutlet weak var date: UILabel!
	@IBOutlet weak var day: UILabel!
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var location: UILabel!
	
	var booking: Booking! {
		didSet {
			date.text = "\(booking.date)"
			day.text = booking.day
			name.text = booking.name
			location.text = booking.location
		}
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		container.layer.borderColor = UIColor(rgb: 0xE5ECED).cgColor
		container.layer.borderWidth = 1
		container.layer.cornerRadius = 5
		container.layer.shadowOffset = .init(width: 3, height: 1)
		container.layer.shadowColor = UIColor(r: 229, g: 236, b: 237).cgColor
		container.layer.masksToBounds = false
		container.layer.shadowRadius = 3
		container.layer.shadowOpacity = 0.9
	}
}
