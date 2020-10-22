//
//  MainInteractor.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Main Module Interactor
final class MainInteractor: MainInteractorProtocol {

	func fetch(objectFor presenter: MainPresenterProtocol) {
		let entity = data()

		if let object = entity {
			presenter.interactor(self, didFetch: object)
		} else {
			presenter.interactor(self, didFailWith: NSError())
		}
	}

	func formViewModel(object: MainEntity.Shop) -> MainFormViewModel {
		var items: [FormViewItemProtocol] = []
		switch object {
		case .shopItems:
			items = setupShopItems()
		case .zooItems:
			items = setupZooItems()
		}
		return MainFormViewModel(items: items)
	}

	func navigationBarModel(object: MainEntity.Shop) -> MainNavigationBarModel {
		switch object {
		case .shopItems:
			return MainNavigationBarModel(title: "Магазин", buttonTitle: "Выход")
		case .zooItems:
			return MainNavigationBarModel(title: "Зоомагазин", buttonTitle: "Выход")
		}
	}

	private func data() -> MainEntity.Type? {
		return Optional(MainEntity.self)
	}

	private func setupShopItems() -> [FormViewItemProtocol] {
		var items: [FormViewItemProtocol] = []
		items.append(PlainItem(title: "Вкусные пончики всего по 60 рублей",
							   subtitle: "Студентам и пенсионерам бесплатно",
							   image: UIImage(named: "logo"),
							   caption: "Акциая действует только до 2 ноября"))
		items.append(PlainItem(title: "Coca-Cola по 39 рублей",
							   subtitle: "Студентам бесплатно",
							   image: UIImage(named: "logo"),
							   caption: "Акциая действует только до 10 ноября"))
		items.append(PlainItem(title: "Чипсы Lays - 80 рублей",
							   subtitle: "Всем платно",
							   image: UIImage(named: "logo"),
							   caption: "Акциая действует только до 1 ноября"))
		items.append(ButtonItem(style: .accept, title: "Купить", action: {}))
		return items
	}

	private func setupZooItems() -> [FormViewItemProtocol] {
		var items: [FormViewItemProtocol] = []
		items.append(ReadonlyFieldItem(title: "Лабрадор в добрые руки", text: "Отдаю лабрадора, нечем его кормить"))
		items.append(ReadonlyFieldItem(title: "Котенок в добрые руки", text: "Котенку нужен новый хозяин, старый умер"))
		items.append(ReadonlyFieldItem(title: "Отдам кота за 1 рубль", text: """
						Продаю долбаного кота почти за бесценок, просто хочу получить хоть что-то за него
						"""))
		return items
	}
}
