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
		static let main: CGFloat = 4.0
		static let imageDiameter: CGFloat = 48.0
		static let dividerHeight: CGFloat = 0.5
	}

	// MARK: - UI Properties

	private let title = Label(text: "", style: .body)
	private let subtitle = Label(text: "", style: .footnoteSecondary)
	private let caption = Label(text: "", style: .captionSecondary)
	private let img: UIImageView = UIImageView()
	private var divider: UIView = {
		let view = UIView()
		view.backgroundColor = Token.background5.color
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	// MARK: - Constraints

	private var dividerTopConstraint: NSLayoutConstraint?
	private var dividerHeightConstraint: NSLayoutConstraint?
	private var titleLeadingAnchor: NSLayoutConstraint?

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupPlainCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - FormViewCellProtocol

extension PlainCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let plainItem = item as? PlainItem else { return }

		title.text = plainItem.title
		subtitle.text = plainItem.subtitle
		caption.text = plainItem.caption
		img.image = plainItem.image
		titleLeadingAnchor?.constant = plainItem.image != nil ? Constants.side * 2 + Constants.imageDiameter : Constants.side
		dividerHeightConstraint?.constant = plainItem.caption?.isEmpty != nil ? Constants.dividerHeight : 0
		dividerTopConstraint?.constant = plainItem.caption?.isEmpty != nil ? Constants.side : 0
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - Private

extension PlainCell {

	private func setupPlainCell () {
		backgroundColor = .clear
		title.numberOfLines = 1
		subtitle.numberOfLines = 2
		caption.numberOfLines = 0
		img.layer.masksToBounds = true
		img.layer.cornerRadius = Constants.imageDiameter / 2

		for view in [title, subtitle, caption, img, divider] {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}

		let titleLeadingAnchor = title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
		let dividerHeightConstraint = divider.heightAnchor.constraint(equalToConstant: Constants.dividerHeight)
		let dividerTopConstraint = divider.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: Constants.side)
		NSLayoutConstraint.activate([
			img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.side),
			img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.side),
			img.heightAnchor.constraint(equalToConstant: Constants.imageDiameter),
			img.widthAnchor.constraint(equalToConstant: Constants.imageDiameter),

			title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.side),
			titleLeadingAnchor,
			title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.side),

			subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.main),
			subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
			subtitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),

			dividerTopConstraint,
			divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
											 constant: Constants.side + Constants.imageDiameter / 2),
			divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			dividerHeightConstraint,

			caption.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: Constants.main),
			caption.leadingAnchor.constraint(equalTo: divider.leadingAnchor),
			caption.trailingAnchor.constraint(equalTo: title.trailingAnchor),
			caption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.side)
		])
		self.titleLeadingAnchor = titleLeadingAnchor
		self.dividerHeightConstraint = dividerHeightConstraint
		self.dividerTopConstraint = dividerTopConstraint
	}
}
