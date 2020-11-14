//
//  MainViewController.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// ViewController модуля Main
final class MainViewController: UIViewController {

	// MARK: - Private Properties

	private let moduleMainView = MainView()
	private var presenter: MainPresenterProtocol = MainPresenter()
	private var model: MainModel?

	// MARK: - ViewController Life Cycle

	override func loadView() {
		moduleMainView.delegate = self
		moduleMainView.dataSource = self
		view = moduleMainView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewController = self
		presenter.viewDidLoad()
	}

	// MARK: - Objective-C Private

	@objc private func actionBack() {
		self.presenter.navigationBarBackButtonTapped()
	}
}

// MARK: - ViewController Protocol

extension MainViewController: MainViewControllerProtocol {

	func updateItem(with image: UIImage?, index: Int) {
		guard let previous = model?.items[index] as? PlainItem else { return }
		let new = PlainItem(title: previous.title, subtitle: previous.subtitle, image: image ?? UIImage(named: "nil"), caption: previous.caption)
		model?.items[index] = new
		moduleMainView.reloadItem(at: index)
	}

	func set(model: MainModel) {
		self.model = model
		updateNavigationBar(model: model.navigationBarModel)
		moduleMainView.reloadData()
	}
}

// MARK: - View Delegate

extension MainViewController: MainViewDelegate {

}

// MARK: - View DataSource

extension MainViewController: MainViewDataSource {

	func item(at index: Int, view: MainView) -> FormViewItemProtocol? {
		return model?.items[index]
	}

	func itemsFor(view: MainView) -> [FormViewItemProtocol]? {
		return model?.items
	}
}

// MARK: - Private

extension MainViewController {

	private func updateNavigationBar(model: MainNavigationBarModel) {
		self.title = model.title
		let item = UIBarButtonItem(title: model.buttonTitle, style: .plain, target: self, action: #selector(actionBack))
		navigationItem.setLeftBarButton(item, animated: true)
	}
}
