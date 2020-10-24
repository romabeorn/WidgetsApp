//
//  EndpointProtocol.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Протокол удаленного Endpoint
protocol EndpointProtocol {

	/// Endpoint URL
	var url: String { get }

	/// Путь URL
	var path: String { get }

	/// Метод запроса
	var method: HTTPMethod { get }

	/// Запрос
	var task: HTTPTask { get }

	/// Хэдеры запроса
	var headers: HTTPHeaders { get }

	/// Интервал запроса по умолчанию
	var timeoutInterval: TimeInterval { get }
}
