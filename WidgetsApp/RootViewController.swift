//
//  RootViewController.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 07.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Корневой контроллер, отвечающий за переходы внутри приложения
final class RootViewController: UIViewController {

	// MARK: - Private Properties

	private var current: UIViewController

	// MARK: - Init

	/// Инициализатор RootViewController
	init() {
		current = SplashViewController()
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("Coder Is Not Implemented")
	}

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		addChild(current)
		current.view.frame = view.bounds
		view.addSubview(current.view)
		current.didMove(toParent: self)
	}

	// MARK: - Private Methods

	func switchToMainScreen() {
		let mainViewController = MainViewController()
		let main = UINavigationController(rootViewController: mainViewController)
		animateFadeTransition(to: main)
	}

	func switchToLogout() {
		let loginViewController = LoginViewController()
		let logoutScreen = UINavigationController(rootViewController: loginViewController)
		animateDismissTransition(to: logoutScreen)
	}

	private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
		current.willMove(toParent: nil)
		addChild(new)

		transition(from: current,
				   to: new,
				   duration: 0.3,
				   options: [.transitionFlipFromRight],
				   animations: {}) { completed in
			self.current.removeFromParent()
			new.didMove(toParent: self)
			self.current = new
			completion?()
		}
	}

	private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
		current.willMove(toParent: nil)
		addChild(new)
		transition(from: current,
				   to: new,
				   duration: 0.3,
				   options: [.transitionFlipFromLeft],
				   animations: {}) { completed in
			self.current.removeFromParent()
			new.didMove(toParent: self)
			self.current = new
			completion?()
		}
	}
}
