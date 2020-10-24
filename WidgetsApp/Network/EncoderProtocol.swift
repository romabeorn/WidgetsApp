//
//  EncoderProtocol.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Удобный тип для [String: Any]
typealias Params = [String: Any]

/// Перечисление доступных Хэдеров типа Content-Type
enum HeaderField: String {

	/// Ключ типа контента
	static var contentType: String { "Content-Type" }

	/// Тип JSON
	case json = "application/json"

	/// Тип URL Encoded
	case urlEncoded = "application/x-www-form-urlencoded; charset=utf-8"
}

/// Протокол обработки параметров
protocol EncoderProtocol {

	/// Закодирует запрос
	/// - Parameters:
	///   - request: Запрос
	///   - parameters: Параметры запроса
	static func encode(request: inout URLRequest, parameters: Params) throws
}
