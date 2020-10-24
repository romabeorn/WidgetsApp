//
//  FlickrLiveStaticNetworkManager.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Мэнджер
struct FlickrLiveStaticNetworkManager: NetworkManagerProtocol {

	// MARK: - FlickrLiveStaticNetworkManagerProtocol (Properties)

	let router = NetworkRouter<FlickrLiveStaticEndpoint>()
}

extension FlickrLiveStaticNetworkManager: FlickrLiveStaticNetworkManagerProtocol {

	func getImage(image: FlickrImage, completion: @escaping NetworkRouterCompletion) {
		var endpoint = FlickrLiveStaticEndpoint()
		endpoint.path = "\(image.server)/\(image.id)_\(image.secret).jpg"
		router.request(endpoint, completion: completion)
	}
}
