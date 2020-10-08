//
//  FormViewCellDelegate.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Протокол обратной связи ячейки FormView
protocol FormViewCellDelegate: UITableViewCell {

	/// Передать элемент FormView ячейке Formview
	/// - Parameter item: Элемент FormView
	func setFormItem(item: FormViewItemProtocol)

	/// Высота ячейки
	var height: CGFloat { get }
}
