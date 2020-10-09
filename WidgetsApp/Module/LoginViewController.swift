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

	// MARK: - Private Properties

	private let formView: FormView = FormView()
	private let defaultOffSet: CGFloat = 16.0
	private let defaultAnimationDuration: Double = 0.25

	// MARK: - View Life Cycle

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow(notification:)),
											   name: UIWindow.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide(notification:)),
											   name: UIWindow.keyboardDidHideNotification,
											   object: nil)
	}

	override func viewDidLoad() {
		setupController()
		setupFormView()
		setupConstraints()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.removeObserver(self, name: UIWindow.keyboardDidHideNotification, object: nil)
	}
}

// MARK: - Private

extension LoginViewController {

	private func setupController() {
		view.backgroundColor = Token.smog0.color
	}

	private func setupFormView() {
		let imageItem = ImageItem(name: "logo", diameter: 150, title: "Авторизация")
		let loginItem = InputFieldItem(placeholder: "Введите имя пользователя")
		let passwordItem = InputFieldItem(placeholder: "Введите пароль")
		let style: ButtonStyle = .gradient(colorA: Token.autumn0.color, colorB: Token.autumn1.color)
		var buttonItem4 = ButtonItem(style: style, title: "Войти")
		buttonItem4.action = { self.login() }
		formView.items = [imageItem, loginItem, passwordItem, buttonItem4]
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

	@objc private func login() {
		Vibration.success.vibrate()
		UserDefaults.standard.set(true, forKey: "LOGGED_IN")
		AppDelegate.shared.rootViewController.switchToMainScreen()
	}

	@objc private func keyboardWillShow(notification: NSNotification) {
		let size = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect
		let heigth = view.safeAreaInsets.bottom + CGFloat(size?.height ?? 0) + defaultOffSet
		formView.contentInset = .init(top: 0, left: 0, bottom: heigth, right: 0)
		formView.scrollIndicatorInsets = formView.contentInset
		formView.scrollToRow(at: IndexPath(row: formView.items.count - 1, section: 0), at: .bottom, animated: false)
	}

	@objc private func keyboardWillHide(notification: NSNotification) {
		let bottomInset = view.safeAreaInsets.bottom
		let number = notification.userInfo?[UIWindow.keyboardAnimationDurationUserInfoKey] as? NSNumber
		let duration: Double = number?.doubleValue ?? defaultAnimationDuration
		UIView.animate(withDuration: duration) {
			self.formView.contentInset = .init(top: 0, left: 0, bottom: bottomInset, right: 0)
			self.formView.scrollIndicatorInsets = self.formView.contentInset
		}
	}
}
