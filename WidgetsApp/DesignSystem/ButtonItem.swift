//
//  ButtonItem.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 09.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Элемент ButtonItem для FormView
struct ButtonItem {

	/// Стиль кнопки
	let style: ButtonStyle

	/// Заголовок кнопки
	let title: String

	/// Действие по нажатию
	var action: (() -> Void)?
}

// MARK: - FormViewItemProtocol

extension ButtonItem: FormViewItemProtocol {

	var identifier: String { "ButtonItem" }

	var type: FormViewCellProtocol.Type { ButtonCell.self }
}
