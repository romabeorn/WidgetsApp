//
//  NetworkRouter.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Роутер сетевого слоя приложения
final class NetworkRouter<Endpoint: EndpointProtocol> {

	// MARK: - Private Properties

	private var task: URLSessionTask?
}

// MARK: - NetworkRouterProtocol

extension NetworkRouter: NetworkRouterProtocol {

	func request(_ endpoint: Endpoint, completion: @escaping NetworkRouterCompletion) {
		let session = URLSession.shared

		do {
			let request = try buildRequest(from: endpoint)
			task = session.dataTask(with: request, completionHandler: { data, response, error in
				completion(data, response, error)
			})
		} catch {
			completion(nil, nil, error)
		}
		task?.resume()
	}

	func cancel() {
		task?.cancel()
	}
}

// MARK: - Private

extension NetworkRouter {

	private func buildRequest(from endpoint: EndpointProtocol) throws -> URLRequest {

		// Формируем запрос на основе данных Endpoint
		guard let url = URL(string: "\(endpoint.url)\(endpoint.path)") else { throw NetworkError.missingURL }
		var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: endpoint.timeoutInterval)
		request.httpMethod = endpoint.method.rawValue

		// Формируем тело запроса на основе данных Endpoint
		switch endpoint.task {
		case .request:
			request.setValue(HeaderField.json.rawValue, forHTTPHeaderField: HeaderField.contentType)
		case .requestWithBodyURL(let body, let query):
			try configureParameters(body: body, query: query, request: &request)
		case .requestWithBodyURLHeaders(let body, let query, let headers):
			addHeaders(headers: headers, request: &request)
			try configureParameters(body: body, query: query, request: &request)
		}

		return request
	}

	private func configureParameters(body: Params?, query: Params?, request: inout URLRequest) throws {
		do {
			// Если есть тело кодируем его
			if let body = body {
				try BodyEncoder.encode(request: &request, parameters: body)
			}

			// Если есть параметры кодируем их (Важно, если есть только параметры, а тела нет, то Content Type будет URLEncoded)
			if let query = query {
				try QueryEncoder.encode(request: &request, parameters: query)
			}
		} catch {
			throw error
		}
	}

	private func addHeaders(headers: HTTPHeaders?, request: inout URLRequest) {
		guard let headers = headers else { return }
		headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
	}
}
