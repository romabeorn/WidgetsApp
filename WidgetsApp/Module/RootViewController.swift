//
//  RootViewController.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 07.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Протокол навигации по приложению
protocol RootNavigationProtocol {

	/// Переключение на главный экран
	func switchToMainScreen()

	/// Переключение на экран входа
	func switchToLogout()
}

/// Корневой контроллер, отвечающий за переходы внутри приложения
final class RootViewController: UIViewController {

	// MARK: - Private Properties

	private var current: UIViewController

	// MARK: - Init

	/// Инициализаторы RootViewController
	init() {
		current = SplashViewController()
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		AppDelegate.shared.window?.overrideUserInterfaceStyle = .dark
		addChild(current)
		current.view.frame = view.bounds
		view.addSubview(current.view)
		current.didMove(toParent: self)
	}
}

// MARK: - RootNavigationProtocol

extension RootViewController: RootNavigationProtocol {

	func switchToMainScreen() {
		let mainViewController = MainViewController()
		let main = UINavigationController(rootViewController: mainViewController)
		animateFadeTransition(to: main)
	}

	func switchToLogout() {
		let loginViewController = LoginViewController()
		animateDismissTransition(to: loginViewController)
	}
}

// MARK: - Private

extension RootViewController {

	private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
		current.willMove(toParent: nil)
		addChild(new)
		transition(from: current, to: new, duration: 0.3, options: [.transitionFlipFromRight], animations: {
		}, completion: { _ in
			self.current.removeFromParent()
			new.didMove(toParent: self)
			self.current = new
			completion?()
		})
	}

	private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
		current.willMove(toParent: nil)
		addChild(new)
		transition(from: current, to: new, duration: 0.3, options: [.transitionFlipFromLeft], animations: {
		}, completion: { _ in
			self.current.removeFromParent()
			new.didMove(toParent: self)
			self.current = new
			completion?()
		})
	}
}

// MARK: - Overrided

extension RootViewController {

	/// Меняет тему приложения при встрязивании телефона
	/// - Parameters:
	///   - motion: Тип события
	///   - event: Событие
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			let style = AppDelegate.shared.window?.overrideUserInterfaceStyle
			AppDelegate.shared.window?.overrideUserInterfaceStyle = style == .dark ? .light : .dark
		}
	}
}
