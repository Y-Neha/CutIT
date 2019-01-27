//  
//  HomePresenter.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import Foundation

class HomePresenter: NSObject {

	// MARK: - VIPER Stack
	lazy var interactor: HomePresenterToInteractorInterface = HomeInteractor()
	lazy var view: HomePresenterToViewInterface = HomeView()
	lazy var wireframe: HomePresesnterToWireframeInterface = HomeWireframe()
}

extension HomePresenter: HomeViewToPresenterInterface {
	
}

extension HomePresenter: HomeInteractorToPresenterInterface {
	
}

extension HomePresenter: HomeWireframeToPresenterInterface {
	
}
