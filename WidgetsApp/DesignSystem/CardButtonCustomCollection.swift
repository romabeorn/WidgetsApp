//
//  CardButtonCustomCollection.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 20.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation
import UIKit

/// Коллекция карточек
class CardButtonCustomCollection: UICollectionView {

// MARK: - private properties

	var cards: [CardButtonItem] = []
	let identifier = "CardButtonCustomCell"

// MARK: - Overrided

	override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: frame, collectionViewLayout: layout)
		delegate = self
		dataSource = self

		register(CardButtonCustomCell.self, forCellWithReuseIdentifier: identifier)
		showsHorizontalScrollIndicator = false
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension CardButtonCustomCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cards.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
															  for: indexPath) as? CardButtonCustomCell else {
			return CardButtonCustomCell(frame: .zero)
		}

		let card = cards[indexPath.item]

		myCell.layer.cornerRadius = 15
		myCell.cardButtonItem = card

		if let bgColor = card.style?.color {
			myCell.backgroundColor = bgColor
		}

		return myCell
	}
}
