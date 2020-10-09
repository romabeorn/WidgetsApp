//
//  Label.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Текстовое поле
final class Label: UILabel {

	// MARK: - Properties

	/// Стиль поля
	let style: Typography

	// MARK: - Init

	init(text: String, style: Typography) {
		self.style = style
		super.init(frame: .zero)
		self.text = text
		self.font = Font.from(item: style.item)
		self.textColor = style.item.token.color
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}
