//
//  NetworkRouterProtocol.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Удобный тип
typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> Void

/// Перечисление сетевых ошибок
enum NetworkError: String, Error {

	case encodingBody = "[Body] При кодировании тела запроса произошла ошибка"
	case encodingQuery = "[Query] При кодировании параметров запроса произошла ошибка"
	case missingURL = "[URL] при формировании URL произошла ошибка"
}

/// Протокол NetworkRouter
protocol NetworkRouterProtocol {

	/// Ассоциативный тип
	associatedtype Endpoint: EndpointProtocol

	/// Сделать запрос
	/// - Params:
	///   - endpoint: Endpoint
	///   - completion: Вызов блока в конце
	func request(_ endpoint: Endpoint, completion: @escaping NetworkRouterCompletion)

	/// Отменить запрос
	func cancel()
}
