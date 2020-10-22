//
//  MainRouter.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Main Module Router
final class MainRouter: MainRouterProtocol {

	func navigateToMainScreen() {
		AppDelegate.shared.rootViewController.switchToLogout()
	}
}
