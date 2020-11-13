//
//  CardButtonStackCell.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 20.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation
import UIKit

/// CardField ячейка
final class CardButtonStackCell: UITableViewCell {

	// MARK: - Private Properties

	private let sideOffset: CGFloat = 0.0
	private let cardHeight: CGFloat = 200.0
	private let collection: CardButtonCustomCollection = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal

		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		layout.itemSize = CGSize(width: 160, height: 160)

		let collection = CardButtonCustomCollection(frame: .zero, collectionViewLayout: layout)

		collection.register(CardButtonCustomCell.self, forCellWithReuseIdentifier: "CardButtonCustomCell")
		collection.backgroundColor = .clear

		return collection
	}()

	// MARK: - Overrided

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupCardButtonStackCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - FormViewCellProtocol

extension CardButtonStackCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let fieldItem = item as? CardButtonStackItem else { return }

		collection.cards = fieldItem.cards
	}

	var height: CGFloat { UITableView.automaticDimension }
}

// MARK: - Private

extension CardButtonStackCell {
	private func setupCardButtonStackCell () {
		backgroundColor = .clear

		for view in [collection] {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}

		NSLayoutConstraint.activate([
			collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sideOffset),
			collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sideOffset),
			collection.heightAnchor.constraint(equalToConstant: cardHeight),
			collection.topAnchor.constraint(equalTo: contentView.topAnchor),
			collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)
		])
	}
}
