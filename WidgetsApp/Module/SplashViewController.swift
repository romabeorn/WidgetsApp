//
//  SplashViewController.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 07.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Начальный анимационный экран
final class SplashViewController: UIViewController {

	// MARK: - Private Properties

	private let activityIndicator = UIActivityIndicatorView(style: .large)

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = Token.backgroundSecondary.color
		view.addSubview(activityIndicator)
		activityIndicator.frame = view.bounds
		makeServiceCall()
	}
}

// MARK: - Private

extension SplashViewController {

	private func makeServiceCall() {
		activityIndicator.startAnimating()
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(500)) {
			if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
				AppDelegate.shared.rootViewController.switchToScreen(viewController: MainViewController(),
																	 navigationController: UINavigationController())
			} else {
				AppDelegate.shared.rootViewController.switchToScreen(viewController: LoginViewController())
			}
			self.activityIndicator.stopAnimating()
		}
	}
}
