//  
//  HomeView.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
	
	// MARK: - VIPER Stack
	lazy var presenter: HomeViewToPresenterInterface = HomePresenter()
	
	//MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
	
	//MARK: - Properties
	var bookings = [
                    Booking(date: 18, day: "Today", name: "Etiquette Barbers", location: "2406 E 8th St, Los Angeles"),
					Booking(date: 23, day: "Sat", name: "Manly and Sons Barber Co.", location: "1200 N Alvarado St, New York"),
                    Booking(date: 23, day: "Sat", name: "Manly and Sons Barber Co.", location: "1200 N Alvarado St, New York")
                    ]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return bookings.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingCell
		cell.booking = bookings[indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 50))
		let title = UILabel(frame: .init(x: 0, y: 0, width: 100, height: 18))
		title.font = UIFont.init(name: "SFUIText-Bold", size: 15)
		headerView.addSubview(title)
		title.textColor = UIColor(rgb: 0x273D52)
		title.text = "Bookings"
		
		let detail = UILabel(frame: .init(x: tableView.frame.width - 70, y: 0, width: 70, height: 18))
		detail.text = "See All (8)"
		detail.font = UIFont.init(name:"SFUIText-Regular", size:12)
		detail.textColor = UIColor(rgb: 0x273D52)
		headerView.addSubview(detail)
		detail.textAlignment = .right
        headerView.backgroundColor = .white
		return headerView
	}
}

extension HomeView: HomePresenterToViewInterface {
	
}


struct Booking {
	var date: Int
	var day: String
	var name: String
	var location: String
}
