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
		let title = ReadonlyFieldItem(title: "Кнопки вибрации", text: "Ощутите мощь вибраций вашего IPhone")
		let button1 = ButtonItem(style: .negative,
								 title: "Error") { Vibration.error.vibrate() }
		let button2 = ButtonItem(style: .gradient(colorA: Token.negative.color, colorB: Token.warning.color),
								 title: "Heavy") { Vibration.heavy.vibrate() }
		let button3 = ButtonItem(style: .gradient(colorA: Token.warning.color, colorB: Token.smog0.color),
								 title: "Medium") { Vibration.medium.vibrate() }
		let button4 = ButtonItem(style: .gradient(colorA: Token.smog0.color, colorB: Token.smog3.color),
								 title: "Light") { Vibration.light.vibrate() }
		let button5 = ButtonItem(style: .gradient(colorA: Token.autumn3.color, colorB: Token.autumn3.color),
								 title: "OldSchool") { Vibration.oldSchool.vibrate() }
		let button6 = ButtonItem(style: .gradient(colorA: Token.autumn1.color, colorB: Token.autumn2.color),
								 title: "Rigid") { Vibration.rigid.vibrate() }
		let button7 = ButtonItem(style: .gradient(colorA: Token.smog2.color, colorB: Token.smog3.color),
								 title: "Selection") { Vibration.selection.vibrate() }
		let button8 = ButtonItem(style: .gradient(colorA: Token.smog3.color, colorB: Token.smog2.color),
								 title: "Soft") { Vibration.soft.vibrate() }
		let button9 = ButtonItem(style: .accept,
								 title: "Success") { Vibration.success.vibrate() }
		let button10 = ButtonItem(style: .warning,
								  title: "Warning") { Vibration.warning.vibrate() }
		return [title, button1, button2, button3, button4, button5, button6, button7, button8, button9, button10]
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
