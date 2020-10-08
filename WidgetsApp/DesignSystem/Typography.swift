//
//  Typography.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Структура элемента типографии
struct TypographyItem {

	/// Размер шрифта
	let size: CGFloat

	/// Тип шрифта
	let font: Font

	/// Оттенок
	let token: Token
}

/// Стиль типографии
enum Typography: String {

	case footnote
	case footnoteSecondary
	case footnoteBrand
	case body
	case bodySecondary
	case bodyBrand
	case title
	case titleSecondary
	case titleBrand
	case headline
	case headlineSecondary
	case headlineBrand

	/// Элемент типографии в зависимости от стиля
	var item: TypographyItem {
		switch self {
			case .footnote:
				return .init(size: 13, font: .SemiBold, token: .text)
			case .footnoteSecondary:
				return .init(size: 13, font: .SemiBold, token: .textSecondary)
			case .footnoteBrand:
				return .init(size: 13, font: .SemiBold, token: .smog0)
			case .body:
				return .init(size: 15, font: .SemiBold, token: .text)
			case .bodySecondary:
				return .init(size: 15, font: .SemiBold, token: .textSecondary)
			case .bodyBrand:
				return .init(size: 15, font: .SemiBold, token: .smog0)
			case .title:
				return .init(size: 20, font: .Regular, token: .text)
			case .titleSecondary:
				return .init(size: 20, font: .Regular, token: .textSecondary)
			case .titleBrand:
				return .init(size: 20, font: .Regular, token: .smog0)
			case .headline:
				return .init(size: 30, font: .Bold, token: .text)
			case .headlineSecondary:
				return .init(size: 30, font: .Bold, token: .textSecondary)
			case .headlineBrand:
				return .init(size: 30, font: .Bold, token: .smog0)
		}
	}
}
