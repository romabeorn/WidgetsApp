//
//  ImageItem.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Элемент ImageItem для FormView
struct ImageItem {

	/// Имя изображения в ресурсах
	let name: String

	/// Диаметр изображения
	let diameter: CGFloat

	/// Подпись для изображения
	let title: String?
}

// MARK: - FormViewItemProtocol

extension ImageItem: FormViewItemProtocol {

	var identifier: String { "ImageItem" }

	var type: FormViewCellProtocol.Type { ImageCell.self }
}
