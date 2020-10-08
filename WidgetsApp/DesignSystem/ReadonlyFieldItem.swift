//
//  ReadonlyFieldItem.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Элемент ReadonlyField для FormView
struct ReadonlyFieldItem {

	/// Заголовок
	let title: String

	/// Основной текст
	let text: String
}

// MARK: - FormViewItemProtocol

extension ReadonlyFieldItem: FormViewItemProtocol {

	var identifier: String { "ReadonlyFieldItem" }

	var type: FormViewCellDelegate.Type { ReadonlyFieldCell.self }
}
