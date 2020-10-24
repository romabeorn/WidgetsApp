//
//  HTTPTask.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Удобный тип для [String: String]
typealias HTTPHeaders = [String: String]

/// Перечисление типов запроса
enum HTTPTask {

	/// Обычный запрос
	case request

	/// Запрос с данными в Body и URL
	case requestWithBodyURL(body: Params?, query: Params?)

	/// Запрос с данными в Body, URL и Headers
	case requestWithBodyURLHeaders(body: Params?, query: Params?, headers: HTTPHeaders?)
}
