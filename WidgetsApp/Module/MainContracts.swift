//
//  MainContracts.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

// MARK: - ViewController Protocol

/// Main Module View Controller Protocol
protocol MainViewControllerProtocol: class {

	/// Обновить данные в FormView
	/// - Parameter items: Данные FormViewItemProtocol
	func updateItems(_ items: [FormViewItemProtocol])

	func updateNavigationBar(title: String, buttonTitle: String)
}

// MARK: - Interactor Protocol

/// Main Module Interactor Protocol
protocol MainInteractorProtocol {

	// Fetch Object from Data Layer
	func fetch(objectFor presenter: MainPresenterProtocol)

	/// Модель FormView
	/// - Parameter object: Сущность главного экрана
	func formViewModel(object: MainEntity.Shop) -> MainFormViewModel

	/// Модель навбара
	/// - Parameter object: Сущность главного экрана
	func navigationBarModel(object: MainEntity.Shop) -> MainNavigationBarModel
}

// MARK: - Presenter Protocol

/// Main Module Presenter Protocol
protocol MainPresenterProtocol {

	/// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
	func fetch(objectFor view: MainViewControllerProtocol)

	/// The Interactor will inform the Presenter a successful fetch.
	func interactor(_ interactor: MainInteractorProtocol, didFetch object: MainEntity.Type)

	/// The Interactor will inform the Presenter a failed fetch.
	func interactor(_ interactor: MainInteractorProtocol, didFailWith error: Error)

	/// Была нажата кнопка на навбаре
	func navigationBarBackButtonTapped()
}

// MARK: - Router Protocol

/// Main Module Router Protocol
protocol MainRouterProtocol {

	/// Перейти на главный экран
	func navigateToMainScreen()
}
