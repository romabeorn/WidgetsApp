//
//  MainPresenter.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Main Module Presenter
final class MainPresenter {

	weak private var viewController: MainViewControllerProtocol?
	private var interactor: MainInteractorProtocol
	private var wireframe: MainRouterProtocol

	// MARK: - Init

	init(viewController: MainViewControllerProtocol) {
		self.viewController = viewController
		self.interactor = MainInteractor()
		self.wireframe = MainRouter()
	}
}

// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {

	func fetch(objectFor view: MainViewControllerProtocol) {
		interactor.fetch(objectFor: self)
	}

	func interactor(_ interactor: MainInteractorProtocol, didFetch object: MainEntity.Type) {

		let formViewModel = interactor.formViewModel(object: object.Shop.shopItems)
		let navigationBarModel = interactor.navigationBarModel(object: object.Shop.shopItems)

		viewController?.updateItems(formViewModel.items)
		viewController?.updateNavigationBar(title: navigationBarModel.title, buttonTitle: navigationBarModel.buttonTitle)
	}

	func interactor(_ interactor: MainInteractorProtocol, didFailWith error: Error) {

	}

	func navigationBarBackButtonTapped() {
		Vibration.heavy.vibrate()
		UserDefaults.standard.set(false, forKey: "LOGGED_IN")
		wireframe.navigateToMainScreen()
	}
}
