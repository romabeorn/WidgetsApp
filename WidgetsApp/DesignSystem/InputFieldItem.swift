//
//  InputFieldItem.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Элемент InputFieldItem для FormView
struct InputFieldItem {

	/// Делегат поля ввода
	weak var delegate: UITextFieldDelegate?

	/// Placeholder
	let placeholder: String
}

// MARK: - FormViewItemProtocol

extension InputFieldItem: FormViewItemProtocol {

	var identifier: String { "InputFieldItem" }

	var type: FormViewCellProtocol.Type { InputFieldCell.self }
}
