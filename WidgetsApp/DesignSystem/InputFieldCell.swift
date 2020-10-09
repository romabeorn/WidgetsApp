//
//  InputFieldCell.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// InputFieldCell ячейка
final class InputFieldCell: UITableViewCell {

	// MARK: - Private Properties

	private let field = InputField(insets: .init(top: 0, left: 12, bottom: 0, right: 12))

	private let fieldHeight: CGFloat = 40.0
	private let sideOffset: CGFloat = 32.0
	private let verticalOffset: CGFloat = 4.0

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupInputFieldCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - FormViewCellDelegate

extension InputFieldCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let fieldItem = item as? InputFieldItem else { return }
		let attributes = [NSAttributedString.Key.foregroundColor: Token.textSecondary.color]
		field.attributedPlaceholder = NSAttributedString(string: fieldItem.placeholder, attributes: attributes)
		field.delegate = fieldItem.delegate ?? self
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - UITextFieldDelegate

extension InputFieldCell: UITextFieldDelegate {

	func textFieldDidBeginEditing(_ textField: UITextField) {
		Vibration.light.vibrate()
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}

// MARK: - Private

extension InputFieldCell {

	private func setupInputFieldCell() {
		selectionStyle = .none
		backgroundColor = .clear
		field.delegate = self
		field.layer.cornerRadius = fieldHeight / 2
		field.textColor = Token.textInverse.color
		field.layer.backgroundColor = Token.smog3.color.cgColor
		field.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(field)
		NSLayoutConstraint.activate([
			field.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalOffset),
			field.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideOffset),
			field.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			field.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalOffset),
			field.heightAnchor.constraint(equalToConstant: fieldHeight)
		])
	}
}
