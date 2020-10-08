//
//  Token.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Токен темы
enum Token: String {

	/// Токены фонов
	case background0
	case background1
	case background2
	case background3
	case background4
	case background5

	/// Токены оттенков Smog
	case smog0
	case smog1
	case smog2
	case smog3

	/// Токены оттенков Осени
	case autumn0
	case autumn1
	case autumn2
	case autumn3

	/// Токены цветов текста
	case text
	case textSecondary
}

// MARK: - Token Extension

extension Token {

	/// Динамический цвет
	var color: UIColor {
		let systemColor = UIColor(named: self.rawValue)
		return systemColor ?? .black
	}
}
