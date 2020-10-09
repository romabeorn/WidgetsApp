//
//  InputField.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Поле ввода
final class InputField: UITextField {

	// MARK: - Public properties

	/// Внутренние отступы
	let insets: UIEdgeInsets

	// MARK: - Init

	init(insets: UIEdgeInsets) {
		self.insets = insets
		super.init(frame: .zero)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - Overrided

extension InputField {

	override func textRect(forBounds bounds: CGRect) -> CGRect {
		bounds.inset(by: insets)
	}

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		bounds.inset(by: insets)
	}
}
