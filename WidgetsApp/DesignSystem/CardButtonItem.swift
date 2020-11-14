//
//  CardButtonItem.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 20.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Элемент карточки
final class CardButtonItem {

	/// Инициализатор
	/// - Parameters:
	///   - title: Заголовок
	///   - logo: Логотип
	///   - iconConfiguration: конфигурация иконки
	///   - style: задний фон для карточки
	init(title: String, icon: Icon? = nil, iconConfiguration: IconConfiguration? = nil, style: Token? = nil) {
		self.title = title
		self.icon = icon
		self.iconConfiguration = iconConfiguration
		self.style = style
	}

	/// Заголок карточки
	let title: String

	/// Иконка карточки
	let icon: Icon?

	/// Конфигурация иконки
	let iconConfiguration: IconConfiguration?

	/// Задний фон карточки
	let style: Token?
}
