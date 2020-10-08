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
		view.backgroundColor = Token.background0.color
		view.addSubview(activityIndicator)
		activityIndicator.frame = view.bounds
		activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
		makeServiceCall()
	}

	// MARK: - Private Methods

	private func makeServiceCall() {
		activityIndicator.startAnimating()
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
			if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
				AppDelegate.shared.rootViewController.switchToMainScreen()
			} else {
				AppDelegate.shared.rootViewController.switchToLogout()
			}
			self.activityIndicator.stopAnimating()
		}
	}
}
