//
//  QueryEncoder.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

// MARK: - EncoderProtocol

/// Кодер параметров URL
struct QueryEncoder: EncoderProtocol {

	static func encode(request: inout URLRequest, parameters: Params) throws {
		guard let url = request.url else { throw NetworkError.missingURL }

		if var components = URLComponents(url: url, resolvingAgainstBaseURL: true), !parameters.isEmpty {
			components.queryItems = [URLQueryItem]()
			parameters.forEach {
				let item = URLQueryItem(name: $0.key, value: "\($0.value)")
				components.queryItems?.append(item)
			}
			request.url = components.url
		} else {
			throw NetworkError.encodingQuery
		}

		if request.value(forHTTPHeaderField: HeaderField.contentType) == nil {
			request.setValue(HeaderField.urlEncoded.rawValue, forHTTPHeaderField: HeaderField.contentType)
		}
	}
}
