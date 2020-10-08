//
//  FormViewItemProtocol.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import Foundation

/// Протокол элемента FormView
protocol FormViewItemProtocol {

	/// Идентификатор ячейки
	var identifier: String { get }

	/// Тип ячейки
	var type: FormViewCellDelegate.Type { get }
}
