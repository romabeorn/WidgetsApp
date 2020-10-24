//
//  MainContracts.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

// MARK: - ViewController Protocol

/// Протокол Main Module View Controller
protocol MainViewControllerProtocol: class {

	/// Обновить данные на основе модели
	/// - Parameter model: модель данных
	func set(model: MainModel)

	/// Обновить данные в ячейке
	/// - Parameters:
	///   - image: Ячейка
	///   - index: Номер ячейки
	func updateItem(with image: UIImage?, index: Int)
}

// MARK: - Interactor Protocol

/// Протокол Main Module Interactor
protocol MainInteractorProtocol {

	/// Извлечь Entity из Interactor
	/// - Parameter presenter: объект Presenter
	func fetch(entityFor presenter: MainPresenterProtocol)
}

// MARK: - Presenter Protocol

/// Протокол Main Module Presenter
protocol MainPresenterProtocol {

	// MARK: - ViewController -> Presenter

	/// ViewController модуля
	var viewController: MainViewControllerProtocol? { get set }

	/// ViewController объявит Presenter, что он загрузился 
	func viewDidLoad()

	/// ViewController объявит Presenter, что была нажата клавиша "Назад" на навигационной панели
	func navigationBarBackButtonTapped()

	// MARK: - Interactor -> Presenter

	/// Interactor объявит Presenter об успешном извлечении Entity
	/// - Parameter entity: Сущность модуля
	func interactor(didFetch entity: MainEntity)

	/// Interactor объявит Presenter о том, что при извлечении Entity произошла ошибка
	/// - Parameter error: Ошибка
	func interactor(didFailWith error: Error)
}

// MARK: - Router Protocol

/// Протокол Main Module Router
protocol MainRouterProtocol {

	/// Перейти на экран
	/// - Parameter viewController: Объект UIViewController
	func navigateTo(viewController: UIViewController)
}
