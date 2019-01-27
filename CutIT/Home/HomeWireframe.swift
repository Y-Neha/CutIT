//  
//  HomeWireframe.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject {
	
	// VIPER Module Constants
	let kStoryboardIdentifier = "Home"
	let kViewIdentifier = "HomeView"
	
	// MARK: - VIPER Stack
	lazy var moduleInteractor = HomeInteractor()
	lazy var modulePresenter = HomePresenter()
	lazy var storyboard: UIStoryboard = UIStoryboard(name: kStoryboardIdentifier, bundle: Bundle.main)
	lazy var moduleView = storyboard.instantiateViewController(withIdentifier: kViewIdentifier) as! HomeView
	lazy var presenter: HomeWireframeToPresenterInterface = modulePresenter
	
	// MARK: - Instance Variables
	var delegate: HomeDelegate?
	
	// MARK: - Initialization
	override init() {
		super.init()
		
		let i = moduleInteractor
		let p = modulePresenter
		let v = moduleView
		
		i.presenter = p
		
		p.interactor = i
		p.view = v
		p.wireframe = self
		
		v.presenter = p
		
		presenter = p
	}
	
}

extension HomeWireframe: HomeModuleInterface {

}

extension HomeWireframe: HomePresesnterToWireframeInterface {
	
}
