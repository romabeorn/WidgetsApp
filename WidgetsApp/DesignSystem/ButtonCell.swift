//
//  ButtonCell.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 09.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// ButtonCell ячейка
final class ButtonCell: UITableViewCell {

	// MARK: - Private Properties

	private let button: Button = Button(title: "")

	private let verticalOffset: CGFloat = 4.0
	private let sideOffset: CGFloat = 32.0

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupButtonCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - FormViewCellDelegate

extension ButtonCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let item = item as? ButtonItem else { return }
		button.style = item.style
		button.text = item.title
		button.action = item.action
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - Private

extension ButtonCell {

	private func setupButtonCell() {
		selectionStyle = .none
		backgroundColor = .clear

		button.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(button)

		NSLayoutConstraint.activate([
			button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalOffset),
			button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideOffset),
			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalOffset)
		])
	}
}
