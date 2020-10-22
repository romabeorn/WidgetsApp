//
//  MainRouter.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation
import UIKit

/// Router модуля Main
final class MainRouter: MainRouterProtocol {

	func navigateTo(viewController: UIViewController) {
		AppDelegate.shared.rootViewController.switchToScreen(viewController: LoginViewController(), animation: .dismiss)
	}
}
