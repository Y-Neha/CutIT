//  
//  HomeInteractor.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import Foundation

class HomeInteractor: NSObject {
	
	// MARK: - VIPER Stack
	lazy var presenter: HomeInteractorToPresenterInterface = HomePresenter()
}

extension HomeInteractor: HomePresenterToInteractorInterface {
	
}
