//
//  MainViewController.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Main Module View
final class MainViewController: UIViewController {

	// MARK: - Private Properties

	private let moduleMainView = MainView()

	private var presenter: MainPresenterProtocol!

	private var object: MainEntity?

	private var items: [FormViewItemProtocol] = []

	// MARK: - ViewController Life Cycle

	override func loadView() {
		moduleMainView.delegate = self
		moduleMainView.dataSource = self
		view = moduleMainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter = MainPresenter(viewController: self)

		// Informs the Presenter that the View is ready to receive data.
		presenter.fetch(objectFor: self)
	}

	@objc private func navBarAction() {
		presenter.navigationBarBackButtonTapped()
	}
}

// MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {

	func updateItems(_ items: [FormViewItemProtocol]) {
		self.items = items
		moduleMainView.reloadData()
	}

	func updateNavigationBar(title: String, buttonTitle: String) {
		self.title = title
		let item = UIBarButtonItem(title: buttonTitle, style: .plain, target: self, action: #selector(navBarAction))
		navigationItem.setLeftBarButton(item, animated: true)
	}
}

// MARK: - MainViewDelegate

extension MainViewController: MainViewDelegate {

}

// MARK: - MainViewDataSource

extension MainViewController: MainViewDataSource {

	func itemsFor(view: MainView) -> [FormViewItemProtocol] {
		return items
	}
}
