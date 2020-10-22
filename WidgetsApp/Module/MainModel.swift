//
//  MainModel.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation

/// Модель данных модуля Main
struct MainModel {

	/// Ячейки FormView
	let items: [FormViewItemProtocol]

	/// Модель навигационной панель
	let navigationBarModel: MainNavigationBarModel
}
