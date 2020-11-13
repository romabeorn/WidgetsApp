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
	}
}
