//
//  PlainItem.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 17.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

struct PlainItem {

	/// Заголовок
	let title: String

	/// подзаговок
	var subtitle: String?

	/// Картинка
	var image: UIImage?

	/// краткий текст
	var caption: String?
}

extension PlainItem : FormViewItemProtocol {

	var identifier: String { "PlainItem" }

	var type: FormViewCellProtocol.Type { PlainCell.self }
}
