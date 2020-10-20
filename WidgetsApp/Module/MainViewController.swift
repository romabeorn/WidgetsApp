//
//  MainViewController.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 07.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Главный экран приложения
final class MainViewController: UIViewController {

	// MARK: - Private Properties

	private let formView: FormView = FormView()

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		setupController()
		formView.items = setupItems()
		setupConstraints()
	}
}

// MARK: - Private

extension MainViewController {

	@objc private func logout() {
		Vibration.heavy.vibrate()
		UserDefaults.standard.set(false, forKey: "LOGGED_IN")
		AppDelegate.shared.rootViewController.switchToLogout()
	}

	private func setupController() {
		view.backgroundColor = Token.backgroundSecondary.color
		title = "Главная"
		let item = UIBarButtonItem(title: "Выход", style: .plain, target: self, action: #selector(logout))
		navigationItem.setLeftBarButton(item, animated: true)
	}

	private func setupItems() -> [FormViewItemProtocol] {
		let item1 = PlainItem(title: "test", subtitle: "subtitle", image: UIImage(named: "logo"), caption: "hello world")

		return [item1]
	}

	private func setupConstraints() {
		view.addSubview(formView)
		formView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			formView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			formView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			formView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
