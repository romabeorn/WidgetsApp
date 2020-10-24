//
//  BodyEncoder.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

// MARK: - EncoderProtocol

/// Кодер тела запроса в JSON
struct BodyEncoder: EncoderProtocol {

	static func encode(request: inout URLRequest, parameters: Params) throws {
		do {
			let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
			request.httpBody = jsonData

			if request.value(forHTTPHeaderField: HeaderField.contentType) == nil {
				request.setValue(HeaderField.json.rawValue, forHTTPHeaderField: HeaderField.contentType)
			}
		} catch {
			throw NetworkError.encodingBody
		}
	}
}
