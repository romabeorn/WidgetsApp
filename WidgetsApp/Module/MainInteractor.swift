//
//  MainInteractor.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Main Module Interactor
final class MainInteractor: MainInteractorProtocol {

	func fetch(entityFor presenter: MainPresenterProtocol) {
		let entity = getData()

		if let entity = entity {
			presenter.interactor(didFetch: entity)
		} else {
			presenter.interactor(didFailWith: NSError())
		}
	}
}

// MARK: - Private

extension MainInteractor {

	private func getData() -> MainEntity? {
		var products: [ProductEntity] = []
		products.append(ProductEntity(name: "Молоко", price: "60 руб.", note: "Акция продолжится до 8 февраля"))
		products.append(ProductEntity(name: "Яйца", price: "80 руб.", note: "Акция продолжится до 27 июня"))
		products.append(ProductEntity(name: "Хлеб", price: "20 руб.", note: "Акция продолжится до 2 мая"))
		products.append(ProductEntity(name: "Сметана", price: "450 руб.", note: "Акция продолжится до 2 мая"))
		products.append(ProductEntity(name: "Вино", price: "670 руб.", note: "Акция продолжится до 2 мая"))
		products.append(ProductEntity(name: "Сосиски", price: "250 руб.", note: "Акция продолжится до 1 мая"))
		products.append(ProductEntity(name: "Сникерс", price: "40 руб.", note: "Акция продолжится до 1 мая"))
		products.append(ProductEntity(name: "Творог", price: "170 руб.", note: "Акция продолжится до 10 декабря"))
		products.append(ProductEntity(name: "Яблоки", price: "50 руб.", note: "Акция продолжится до 5 мая"))
		let entity = MainEntity(products: products)
		return Optional(entity)
	}
}
