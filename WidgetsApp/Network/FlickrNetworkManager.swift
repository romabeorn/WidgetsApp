//
//  FlickrNetworkManager.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// API методы Flickr
enum FlickrMethods: String {

	case photosSearch = "flickr.photos.search"
}

/// Мэнеджер
struct FlickrNetworkManager: NetworkManagerProtocol {

	/// API ключ к Flickr
	static let apiKey = "8873d81d8a5fedee79122b2ff6ef6387"

	// MARK: - NetworkManagerProtocol (Properties)

	let router = NetworkRouter<FlickrEndpoint>()
}

extension FlickrNetworkManager: FlickrNetworkManagerProtocol {

	func getImages(text: String, completion: @escaping NetworkRouterCompletion) {
		var endpoint = FlickrEndpoint()
		endpoint.task = .requestWithBodyURL(body: nil, query: [
			"method": FlickrMethods.photosSearch.rawValue,
			"api_key": FlickrNetworkManager.apiKey,
			"text": text,
			"format": "json",
			"nojsoncallback": "1",
			"per_page": "1",
			"page": "1"
		])
		router.request(endpoint, completion: completion)
	}
}
