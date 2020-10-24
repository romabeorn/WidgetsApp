//
//  FlickrNetworkManagerProtocol.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Протокол чудесного менджера распоряжающегося запросами в API Flickr
protocol FlickrNetworkManagerProtocol {

	/// Взять пачку фоток
	/// - Parameters:
	///   - text: Тема фотографий
	///   - completion: Completion
	func getImages(text: String, completion: @escaping NetworkRouterCompletion)
}
