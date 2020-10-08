//
//  LoginViewController.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 07.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Экран входа в приложение
final class LoginViewController: UIViewController {

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		view.backgroundColor = .white
		title = "Login"
		let item = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(login))
		navigationItem.setLeftBarButton(item, animated: true)

		let label = Label(text: "Вход", style: .headline)
		label.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(label)
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}

	// MARK: - Private Methods

	@objc private func login() {
		UserDefaults.standard.set(true, forKey: "LOGGED_IN")
		AppDelegate.shared.rootViewController.switchToMainScreen()
	}
}
