//
//  NetworkManagerProtocol.swift
//  WidgetsApp
//
//  Created by Beorn on 24.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Протокол Network Manager
protocol NetworkManagerProtocol {

	/// Ассоциативный тип
	associatedtype Endpoint: EndpointProtocol

	/// Роутер менджера
	var router: NetworkRouter<Endpoint> { get }
}
