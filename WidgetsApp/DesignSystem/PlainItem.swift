//
//  PlainItem.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 17.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Модель данных простой ячейки
struct PlainItem {

	/// Заголовок
	let title: String

	/// Подзаголовок
	var subtitle: String

	/// Картинка
	var image: UIImage?

	/// Краткий текст
	var caption: String?
}

extension PlainItem : FormViewItemProtocol {

	var identifier: String { "PlainItem" }

	var type: FormViewCellProtocol.Type { PlainCell.self }
}
