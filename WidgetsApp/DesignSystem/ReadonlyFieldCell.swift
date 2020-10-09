//
//  ReadonlyFieldCell.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// ReadonlyField ячейка
final class ReadonlyFieldCell: UITableViewCell {

	// MARK: - Private Properties

	private let title = Label(text: "", style: .footnoteSecondary)
	private let body = Label(text: "", style: .body)
	private let divider = UIView()

	private let sideOffset: CGFloat = 16.0
	private let topBodyOffset: CGFloat = 2.0
	private let dividerHeight: CGFloat = 0.5

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupReadonlyFieldCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - FormViewCellDelegate

extension ReadonlyFieldCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let fieldItem = item as? ReadonlyFieldItem else { return }
		title.text = fieldItem.title
		body.text = fieldItem.text
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - Private

extension ReadonlyFieldCell {

	private func setupReadonlyFieldCell() {
		selectionStyle = .none
		backgroundColor = .clear
		isUserInteractionEnabled = false
		title.numberOfLines = 1
		body.numberOfLines = 2
		divider.backgroundColor = Token.background5.color

		for view in [divider, title, body] {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}

		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: sideOffset),
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideOffset),
			title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: topBodyOffset),
			body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideOffset),
			body.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			divider.topAnchor.constraint(equalTo: body.bottomAnchor, constant: sideOffset),
			divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2 * sideOffset),
			divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			divider.heightAnchor.constraint(equalToConstant: dividerHeight)
		])
	}
}
