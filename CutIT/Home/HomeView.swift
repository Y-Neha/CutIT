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
    
    @IBOutlet weak var collectionView: UICollectionView!
	
	//MARK: - Properties
	var bookings = Booking.generateData()
    var propositions = Proposition.generateData()
	override func viewDidLoad() {
		super.viewDidLoad()
        collectionView.register(UINib(nibName: "PropositionCell", bundle: nil), forCellWithReuseIdentifier: "PropositionCell")
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
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        let header = Header(frame: frame, title: "Bookings", detail: "See All (8)")
		return header
	}
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return propositions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropositionCell", for: indexPath) as! PropositionCell
        cell.proposition = propositions[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 236, height: 204)
    }
}

extension HomeView: HomePresenterToViewInterface {
	
}


struct Booking {
	var date: Int
	var day: String
	var name: String
	var location: String
    
    static func generateData() -> [Booking] {
        return [
            Booking(date: 18, day: "Today", name: "Etiquette Barbers", location: "2406 E 8th St, Los Angeles"),
            Booking(date: 23, day: "Sat", name: "Manly and Sons Barber Co.", location: "1200 N Alvarado St, New York"),
            Booking(date: 23, day: "Sat", name: "Manly and Sons Barber Co.", location: "1200 N Alvarado St, New York")
        ]
    }
}

struct Proposition {
    var name: String
    var image: UIImage
    var address: String
    var rating: Double
    
    static func generateData() -> [Proposition] {
        return [
            Proposition(name: "Salon Orchard", image: #imageLiteral(resourceName: "2"), address: "189 Orchard St, New York, NY 10002, USA", rating: 3.9),
            Proposition(name: "Marie Robinson salon", image: #imageLiteral(resourceName: "4"), address: "40 W 25th St 10th floor, New York, NY 10010, USA", rating: 4.6),
            Proposition(name: "Dazzle Beauty Salon", image: #imageLiteral(resourceName: "1"), address: "590 3rd Ave, New York, NY 10016, USA", rating: 4.6),
            Proposition(name: "Mizu Salon", image: #imageLiteral(resourceName: "3"), address: "505 Park Ave #3, New York, NY 10022, USA", rating: 2.4)
        ]
    }
}
