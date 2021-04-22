//
//  WidgetsViewController.swift
//  WidgetsApp
//
//  Created by Beorn on 22.04.2021.
//  Copyright © 2021 BeornStudio. All rights reserved.
//

import UIKit

/// Контроллер для демонстрации виджетов
final class WidgetsViewController: UIViewController {

	// MARK: - Private Properties

	private var formView: FormView = {
		let view = FormView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUIElements()
		setupConstraints()
		formView.items = [
			ReadonlyFieldItem(title: "Hello", text: "123")
		]
	}
}

// MARK: - Private

private extension WidgetsViewController {

	func setupUIElements() {
		view.backgroundColor = Token.backgroundSecondary.color
		view.addSubview(formView)
	}

	func setupConstraints() {
		formView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			formView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			formView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			formView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
