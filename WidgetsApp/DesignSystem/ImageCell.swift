//
//  ImageCell.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// ImageCell ячейка
final class ImageCell: UITableViewCell {

	// MARK: - Private Properties

	private let logo: UIImageView = UIImageView()
	private let title: Label = Label(text: "", style: .headlineBrand)

	private var logoConstraints: [NSLayoutConstraint] = []
	private var logoHeight: CGFloat = 200.0
	private let verticalOffset: CGFloat = 40.0
	private let sideOffset: CGFloat = 16.0

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupImageCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - Overrided

extension ImageCell {

	override func layoutSubviews() {
		logo.layer.cornerRadius = logoHeight / 2
	}
}

// MARK: - FormViewCellDelegate

extension ImageCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let item = item as? ImageItem else { return }
		logo.image = UIImage(named: item.name)
		title.text = item.title
		logoHeight = item.diameter
		logoConstraints.forEach { $0.isActive = false }
		logoConstraints = [logo.widthAnchor.constraint(equalToConstant: logoHeight)]
		logoConstraints.forEach { $0.isActive = true }
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - Private

extension ImageCell {

	private func setupImageCell() {
		selectionStyle = .none
		backgroundColor = .clear
		logo.layer.masksToBounds = true
		logo.layer.cornerRadius = logoHeight / 2
		title.textAlignment = .center
		title.numberOfLines = 1
		for view in [title, logo] {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}
		logoConstraints = [logo.widthAnchor.constraint(equalToConstant: logoHeight)]
		logoConstraints.forEach { $0.isActive = true }
		NSLayoutConstraint.activate([
			logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalOffset),
			logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			logo.heightAnchor.constraint(equalTo: logo.widthAnchor),
			logo.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -verticalOffset),
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideOffset),
			title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalOffset)
		])
	}
}
