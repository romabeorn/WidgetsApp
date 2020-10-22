//
//  MainPresenter.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Presenter модуля Main
final class MainPresenter {

	// MARK: - Public Properties

	/// ViewController модуля
	weak var viewController: MainViewControllerProtocol?

	// MARK: - Private Properties

	private var interactor: MainInteractorProtocol = MainInteractor()
	private var router: MainRouterProtocol = MainRouter()
}

// MARK: - Presenter Protocol

extension MainPresenter: MainPresenterProtocol {

	// MARK: - ViewController -> Presenter

	func viewDidLoad() {
		interactor.fetch(entityFor: self)
	}

	func navigationBarBackButtonTapped() {
		UserDefaults.standard.set(false, forKey: "LOGGED_IN")
		self.router.navigateTo(viewController: LoginViewController())
	}

	// MARK: - Interactor -> Presenter

	func interactor(didFetch entity: MainEntity) {
		let navigationBarModel = MainNavigationBarModel(title: "Магазин", buttonTitle: "Выход")
		var items: [PlainItem] = []
		entity.products.forEach {
			items.append(PlainItem(title: $0.name, subtitle: $0.price, image: UIImage(named: "logo"), caption: $0.note))
		}
		let model = MainModel(items: items, navigationBarModel: navigationBarModel)
		viewController?.set(model: model)
	}

	func interactor(didFailWith error: Error) {

	}
}
