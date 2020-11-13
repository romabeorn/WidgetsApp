//
//  IconConfiguration.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 05.11.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

enum IconSize {
	case small
	case middle
	case large
}

struct IconConfiguration {

	// Цвет для темной темы
	let lightColor: UIColor

	// Цвет для светлой темы
	let darkColor: UIColor?

	// Размер иконки
	let size: IconSize
}
