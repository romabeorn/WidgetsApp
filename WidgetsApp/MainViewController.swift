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

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		view.backgroundColor = .white
		title = "Main Screen"
		let item = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
		navigationItem.setLeftBarButton(item, animated: true)

		let title = ReadonlyFieldItem(title: "Россия победила Америку", text: "Шок контент при поддержке первого канала")
		let title2 = ReadonlyFieldItem(title: "МИРЭА - первый университет, где применили", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis euismod odio. Mauris in rhoncus arcu. Suspendisse potenti. Donec ultricies dictum massa nec iaculis. Proin hendrerit libero nec nunc molestie ornare. Duis purus lectus, hendrerit ac nunc non, semper lacinia erat. Duis eu dolor quis arcu sagittis vulputate. Etiam placerat porttitor felis, id bibendum orci placerat sed. Nullam varius hendrerit ipsum, vel convallis ligula molestie ac. Nam consectetur sem nibh, sit amet vestibulum libero sodales id. Suspendisse potenti. Curabitur ligula mi, tincidunt quis purus vitae, elementum sollicitudin libero. Nam at posuere turpis, eget vehicula enim. Quisque nibh urna, consectetur tincidunt iaculis ut, sodales in ex.")
		let title3 = ReadonlyFieldItem(title: "Федор Пидор!", text: "С глубочайшим почтением данное высказывание выразил Матвеев Роман в своем интервью на канале \"Пидоры и Пидарасы Планеты\" в программе \"Давайте хуярить их вместе\"")
		let title4 = ReadonlyFieldItem(title: "Заголовок", text: "Текст")
		let formView = FormView(items: [title, title2, title3, title4])

		view.addSubview(formView)
		formView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			formView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			formView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			formView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}

	// MARK: - Private Methods

	@objc private func logout() {
		UserDefaults.standard.set(false, forKey: "LOGGED_IN")
		AppDelegate.shared.rootViewController.switchToLogout()
	}
}
