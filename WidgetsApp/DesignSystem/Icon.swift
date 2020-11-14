//
//  Icon.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 21.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation
import UIKit

// Иконки
enum Icon: String, CaseIterable {
	case pencil
	case friends
	case collegues
	case logo
	case defaultValue = "default"
	case apple
	case jetpack

	var image: UIImage { UIImage(named: rawValue) ?? UIImage() }

	/// Иконка в зависимости от типа
	/// - Parameter type: тип иконки
	init(type: String?) {
		guard let type = type else {
			self = .defaultValue
			return
		}
		self = Icon(rawValue: type) ?? .defaultValue
	}
}
