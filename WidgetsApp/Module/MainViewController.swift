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
=======
	private func setupItems() -> [FormViewItemProtocol] {
//		var items: [FormViewItemProtocol] = []
//		for _ in 0...10 {
//		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
//							   subtitle: "Студентам и пенсионерам бесплатно"))
//		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
//							   subtitle: "Студентам и пенсионерам бесплатно",
//							   caption: "Акциая действует только до 2 ноября"))
//		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
//							   subtitle: "Студентам и пенсионерам бесплатно",
//							   image: UIImage(named: "logo")))
//		items.append(PlainItem(title: "fuck",
//							   subtitle: "Студентам и пенсионерам бесплатно",
//							   caption: nil))
//		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
//							   subtitle: "Студентам и пенсионерам бесплатно",
//							   caption: ""))
//		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
//							   subtitle: "Студентам и пенсионерам бесплатно",
//							   image: UIImage(named: "logo"),
//							   caption: ""))
//		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
//							   subtitle: "Студентам и пенсионерам бесплатно",
//							   image: UIImage(named: "logo"),
//							   caption: ""))
//		}
		
		let conf = IconConfiguration(lightColor: .lightGray, darkColor: .black, size: .middle)

		let item1 = CardButtonItem(title: "Hello world1", icon: Icon(type: "apple"), iconConfiguration: conf)
		let item2 = CardButtonItem(title: "Hello world2")
		let item3 = CardButtonItem(title: "Hello world3", icon: Icon(type: "apple"), iconConfiguration: conf, style: .card0)
		let item4 = CardButtonItem(title: "Hello world1", icon: Icon(type: "apple"))

		let lenya = CardButtonItem(title: "Leonid", icon: Icon(type: "jetpack"), iconConfiguration: IconConfiguration(lightColor: .yellow, darkColor: .cyan, size: .middle))

		let card1 = CardButtonStackItem(cards: [item1, lenya, item4, item2])
		let card2 = CardButtonStackItem(cards: [item1, item3, item1, item1])

		let card3 = CardButtonStackItem(cards: [lenya, lenya, lenya, lenya])
		return [card1, card2, card3]
>>>>>>> реализовал карточки
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
