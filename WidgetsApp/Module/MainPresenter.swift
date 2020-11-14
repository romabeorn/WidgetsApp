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
	private var flickrService: FlickrNetworkManagerProtocol = FlickrNetworkManager()
	private var flickrLiveStaticService: FlickrLiveStaticNetworkManagerProtocol = FlickrLiveStaticNetworkManager()

	private var items: [FormViewItemProtocol] = []
}

// MARK: - Presenter Protocol

extension MainPresenter: MainPresenterProtocol {

	// MARK: - ViewController -> Presenter

	func viewDidLoad() {
		interactor.fetch(entityFor: self)
	}

	func navigationBarBackButtonTapped() {
		Vibration.soft.vibrate()
		UserDefaults.standard.set(false, forKey: "LOGGED_IN")
		self.router.navigateTo(viewController: LoginViewController())
	}

	// MARK: - Interactor -> Presenter

	func interactor(didFetch entity: MainEntity) {
		let navigationBarModel = MainNavigationBarModel(title: "Магазин", buttonTitle: "Выход")

		var cardStack: [CardButtonItem] = []
		for item in entity.cards {
			let conf = IconConfiguration(lightColor: .lightGray, darkColor: .black)
			cardStack.append(CardButtonItem(title: item.title, icon: Icon(type: item.icon), iconConfiguration: conf))
		}
		let card = CardButtonStackItem(cards: cardStack)
		items.append(card)

		for (index, item) in entity.products.enumerated() {
			getImages(text: item.name, item: index)
			items.append(PlainItem(title: item.name, subtitle: item.price, image: UIImage(named: "nil"), caption: item.note))
		}

		let model = MainModel(items: items, navigationBarModel: navigationBarModel)
		viewController?.set(model: model)
	}

	func interactor(didFailWith error: Error) {

	}
}

// MARK: - Private

extension MainPresenter {

	private func getImages(text: String, item: Int) {
		flickrService.getImages(text: text) { (data, _, error) in
			guard error == nil else { return }
			guard let flickPhotosObject = self.decodeImages(data: data),
				  let image = flickPhotosObject.photos.photo.first else { return }
			self.getImage(image: image, item: item)
		}
	}

	private func getImage(image: FlickrImage, item: Int) {
		self.flickrLiveStaticService.getImage(image: image) { (data, _, _) in
			guard let data = data else { return }
			let image = UIImage(data: data)
			if !Thread.isMainThread {
				DispatchQueue.main.sync {
					self.viewController?.updateItem(with: image, index: item)
				}
			}
			self.viewController?.updateItem(with: image, index: item)
		}
	}

	private func decodeImages(data: Data?) -> FlickrPhotos? {
		guard let data = data else { return nil }
		let decoder = JSONDecoder()
		do {
			let photos = try decoder.decode(FlickrPhotos.self, from: data)
			return photos
		} catch {
			return nil
		}
	}
}
