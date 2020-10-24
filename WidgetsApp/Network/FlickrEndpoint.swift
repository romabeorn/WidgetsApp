//
//  FlickrEndpoint.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

struct FlickrEndpoint: EndpointProtocol {

	var url: String = "https://www.flickr.com/"

	var path: String = "services/rest"

	var method: HTTPMethod = .get

	var task: HTTPTask = .request

	var headers: HTTPHeaders = [:]

	var timeoutInterval: TimeInterval = 10.0
}
