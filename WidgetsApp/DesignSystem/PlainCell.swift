//
//  PlainCell.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 17.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

final class PlainCell: UITableViewCell {

	private struct Constants {
		static let side: CGFloat = 16.0
		static let img: CGFloat = 16.0
		static let main: CGFloat = 8.0
		static let imageDiameter: CGFloat = 48.0
	}

	// MARK: - UI Properties

	private let title = Label(text: "", style: .body)
	private let subtitle = Label(text: "", style: .footnoteSecondary)
	private let caption = Label(text: "", style: .footnoteSecondary)
	private let img: UIImageView = UIImageView()

	// MARK: - Constraints

	private var imageHeightConstraint = NSLayoutConstraint()
	private var imageLeadingConstraint = NSLayoutConstraint()
	private var subtitleTopAnchorConstraint = NSLayoutConstraint()
	private var captionTopAnchorConstraint = NSLayoutConstraint()
	private var titleAndLogoConstraints: [NSLayoutConstraint] = []

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupPlainCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}

	// MARK: - Overrided

	override func prepareForReuse() {
		super.prepareForReuse()
		title.text = nil
		subtitle.text = nil
		img.image = nil
		caption.text = nil
		imageLeadingConstraint.constant = 0
		imageHeightConstraint.constant = 0
		subtitleTopAnchorConstraint.constant = 0
		captionTopAnchorConstraint.constant = 0
	}
}

// MARK: - FormViewCellProtocol

extension PlainCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let plainItem = item as? PlainItem else { return }

		title.text = plainItem.title

		if plainItem.image != nil {
			img.image = plainItem.image
			imageLeadingConstraint.constant = Constants.img
			imageHeightConstraint.constant  = Constants.imageDiameter
		}

		if plainItem.subtitle != nil {
			subtitle.text = plainItem.subtitle
			subtitleTopAnchorConstraint.constant = Constants.main
		}

		if plainItem.caption != nil {
			caption.text = plainItem.caption
			captionTopAnchorConstraint.constant = Constants.main
		}

		if plainItem.caption == nil && plainItem.subtitle == nil && plainItem.image != nil {
			titleAndLogoConstraints.forEach { $0.isActive = false }
			titleAndLogoConstraints = [
				title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
				img.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
			]
			titleAndLogoConstraints.forEach { $0.isActive = true }
		}
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - Private

extension PlainCell {

	private func setupPlainCell () {
		title.numberOfLines = 1
		subtitle.numberOfLines = 2
		caption.numberOfLines = 0
		img.layer.masksToBounds = true
		img.layer.cornerRadius = Constants.imageDiameter / 2

		for view in [title, img, subtitle, caption] {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}

		imageHeightConstraint = img.heightAnchor.constraint(equalToConstant: 0)
		imageLeadingConstraint = img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
		subtitleTopAnchorConstraint = subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0)
		captionTopAnchorConstraint = caption.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 0)

		NSLayoutConstraint.activate([
			imageHeightConstraint,
			imageLeadingConstraint,
			subtitleTopAnchorConstraint,
			captionTopAnchorConstraint,

			img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.side),
			img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.side),
			img.widthAnchor.constraint(equalTo: img.heightAnchor),

			title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.side),
			title.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: Constants.side),
			title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.side),

			subtitle.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: Constants.side),
			subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.side),
			subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.main),

			caption.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: Constants.side),
			caption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.side),
			caption.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: Constants.main),
			caption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.side)
		])
	}
}
