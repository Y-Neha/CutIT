//
//  AppDelegate.swift
//  CutIT
//
//  Created by Yogendra Shelke on 27/01/19.
//  Copyright © 2019 Yogendra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = .init(frame: UIScreen.main.bounds)
		let navigationController = UINavigationController(rootViewController: HomeWireframe().moduleView)
		navigationController.navigationBar.isHidden = true
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		return true
	}
}

