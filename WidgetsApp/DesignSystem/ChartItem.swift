//
//  ChartItem.swift
//  WidgetsApp
//
//  Created by Beorn on 22.04.2021.
//  Copyright © 2021 BeornStudio. All rights reserved.
//

import Foundation

/// Модель данных для графика
struct ChartItem {

	/// Заголовок графика
	let title: String

	/// Массив точке для графика
	let points: [ChartPoint]
}

/// Модельь данных для точки на графике
struct ChartPoint {

	/// Позиция Y
	let y: Int
}

// MARK: - FormViewItemProtocol

extension ChartItem: FormViewItemProtocol {

	var identifier: String { "ChartItem" }

	var type: FormViewCellProtocol.Type { ChartCell.self }
}
