//
//  HTTPMethod.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Перечисление HTTP методов
enum HTTPMethod: String {

	// HTTP Метод "GET"
	case get = "GET"

	// HTTP Метод "POST"
	case post = "POST"

	// HTTP Метод "PUT"
	case put = "PUT"

	// HTTP Метод "PATCH"
	case patch = "PATCH"

	// HTTP Метод "DELETE"
	case delete = "DELETE"
}
