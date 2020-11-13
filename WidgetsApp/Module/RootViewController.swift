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

	/// Перейти на экран
	/// - Parameter viewController: Объект UIViewController
	/// - Parameter navigationController: Объект UINavigationController
	/// - Parameter animation: Анимация появления контроллера
	func switchToScreen(viewController: UIViewController, navigationController: UINavigationController?, animation: Animation)
}

extension RootNavigationProtocol {

	func switchToScreen(viewController: UIViewController,
						navigationController: UINavigationController? = nil,
						animation: Animation = .fade) {
		switchToScreen(viewController: viewController, navigationController: navigationController, animation: animation)
	}
}

/// Animation
enum Animation {

	/// Прямой флип
	case fade
	/// Обратный флип
	case dismiss
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

	func switchToScreen(viewController: UIViewController, navigationController: UINavigationController?, animation: Animation) {
		var controller = viewController
		if navigationController != nil {
			controller = UINavigationController(rootViewController: viewController)
		}
		switch animation {
		case .dismiss:
			animateDismissTransition(to: controller)
		default:
			animateFadeTransition(to: controller)
		}
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

	/// Меняет тему приложения при встряхивании телефона
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
