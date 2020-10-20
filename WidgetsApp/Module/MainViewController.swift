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
		var items: [FormViewItemProtocol] = []
		for _ in 0...10 {
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно"))
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   caption: "Акциая действует только до 2 ноября"))
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   image: UIImage(named: "logo")))
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   caption: ""))
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   caption: ""))
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   image: UIImage(named: "logo"),
							   caption: ""))
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   image: UIImage(named: "logo"),
							   caption: ""))
		}
		return items
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
