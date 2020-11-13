//
//  CardButtonStackItem.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 20.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Элемент стэка карточек 
class CardButtonStackItem {

	/// массив карточек
	let cards: [CardButtonItem]

	/// Инициализатор стэка карточек
	/// - Parameter cards: массив карточек
	init(cards: [CardButtonItem]) {
		self.cards = cards
	}
}

// MARK: - FormViewItemProtocol

extension CardButtonStackItem : FormViewItemProtocol {

	var identifier: String { "CardButtonStackItem" }

	var type: FormViewCellProtocol.Type { CardButtonStackCell.self }
}
