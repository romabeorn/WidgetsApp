//
//  Font.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Шрифт
enum Font: String {

	/// Семейство шрифтов OpenSans
	static var familyName: String { "OpenSans" }

	case bold
	case boldItalic
	case extraBold
	case extraBoldItalic
	case italic
	case light
	case lightItalic
	case regular
	case semiBold
	case semiBoldItalic

	/// Шрифт в зависимости от элемента типографии
	/// - Parameter item: элемент типографии
	/// - Returns: шрифт
	static func from(item: TypographyItem) -> UIFont {
		let font = UIFont(name: "\(Font.familyName)-\(item.font.rawValue)", size: item.size)
		return font ?? UIFont.systemFont(ofSize: 16)
	}
}
