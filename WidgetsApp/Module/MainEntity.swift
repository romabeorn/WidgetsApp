//
//  MainEntity.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Main Module Entity
struct MainEntity {

	/// Shop
	///
	/// - shopItems - Данные продуктового магазина
	/// - zooItems - Данные зоомагазина
	enum Shop: String {
		case shopItems
		case zooItems
	}
}
