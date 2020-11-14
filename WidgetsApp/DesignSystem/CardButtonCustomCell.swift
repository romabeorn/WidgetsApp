//
//  CardButtonCustomCell.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 20.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

class CardButtonCustomCell: UICollectionViewCell {

	// MARK: - Private properties

	private struct Constants {
		static let main: CGFloat = 20.0
		static let imageDiameter: CGFloat = 80.0
	}

	private let title = Label(text: "", style: .bodySecondary)
	private let logo: ImageView = ImageView()

	// MARK: - Public properties

	var cardButtonItem: CardButtonItem? {
		didSet {
			guard let card = cardButtonItem else { return }
			title.text = card.title

			guard let iconImage = card.icon?.image else { return }
			logo.image = iconImage
			logo.configuration = card.iconConfiguration
		}
	}

	// MARK: - Overrided

	override init(frame: CGRect) {
		super.init(frame: frame)
		addViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Constraints

	func addViews() {
		backgroundColor = Token.background2.color

		logo.layer.masksToBounds = true
		logo.layer.cornerRadius = Constants.imageDiameter / 2

		title.textAlignment = .center

		for view in [title, logo] {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}

		logo.heightAnchor.constraint(equalToConstant: Constants.imageDiameter).isActive = true
		logo.widthAnchor.constraint(equalToConstant: Constants.imageDiameter).isActive = true
		logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.main).isActive = true
		logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

		title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.main).isActive = true
		title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.main).isActive = true
		title.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: Constants.main).isActive = true
	}
}
