//
//  FlickrLiveStaticEndpoint.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

struct FlickrLiveStaticEndpoint: EndpointProtocol {

	var url: String = "https://live.staticflickr.com/"

	var path: String = ""

	var method: HTTPMethod = .get

	var task: HTTPTask = .request

	var headers: HTTPHeaders = [:]

	var timeoutInterval: TimeInterval = 10.0
}
