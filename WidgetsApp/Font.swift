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

	case Bold
	case BoldItalic
	case ExtraBold
	case ExtraBoldItalic
	case Italic
	case Light
	case LightItalic
	case Regular
	case SemiBold
	case SemiBoldItalic

	/// Шрифт в зависимости от элемента типографии
	/// - Parameter item: элемент типографии
	/// - Returns: шрифт
	static func from(item: TypographyItem) -> UIFont {
		let font = UIFont(name: "\(Font.familyName)-\(item.font.rawValue)", size: item.size)
		return font ?? UIFont.systemFont(ofSize: 16)
	}
}
