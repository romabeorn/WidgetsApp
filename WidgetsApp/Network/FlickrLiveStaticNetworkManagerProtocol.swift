//
//  FlickrLiveStaticNetworkManagerProtocol.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Протокол чудесного менджера распоряжающегося запросами в API Flickr LiveStatic
protocol FlickrLiveStaticNetworkManagerProtocol {

	/// Получить фотку из модели фото
	/// - Parameters:
	///   - image: Модель фото
	///   - completion: Completion
	func getImage(image: FlickrImage, completion: @escaping NetworkRouterCompletion)
}
