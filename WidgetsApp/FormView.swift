//
//  FormView.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 Beorn. All rights reserved.
//

import UIKit

/// Таблица позволяющая держать в себе разные ячейки
final class FormView: UITableView {

	// MARK: - Public Properties

	/// Вью модели ячеек
	let items: [FormViewItemProtocol]

	// MARK: - Private Properties

	private let identifier: String = "formViewCell"

	// MARK: - Init

	init(items: [FormViewItemProtocol]) {
		self.items = items
		super.init(frame: .zero, style: .plain)
		setupFormView()
	}

	required init?(coder: NSCoder) {
		fatalError("Coder Is Not Implemented")
	}

	// MARK: - Private Methods

	private func setupFormView() {
		items.forEach { register($0.type, forCellReuseIdentifier: $0.identifier) }
		separatorStyle = .none
		delegate = self
		dataSource = self
		estimatedRowHeight = 100
		backgroundColor = Token.background0.color
	}
}

// MARK: - UITableViewDelegate

extension FormView: UITableViewDelegate {

	override var numberOfSections: Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let item = items[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier) as? FormViewCellDelegate else {
			return UITableView.automaticDimension
		}
		return cell.height
	}
}

// MARK: - UITableViewDataSource

extension FormView: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = items[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier) as? FormViewCellDelegate else {
			return UITableViewCell(style: .default, reuseIdentifier: identifier)
		}
		cell.setFormItem(item: item)
		return cell
	}
}
