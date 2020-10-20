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
	var items: [FormViewItemProtocol] = [] {
		didSet {
			setupItems()
		}
	}

	// MARK: - Private Properties

	private let identifier: String = "defalutCellIdentifier"

	// MARK: - Init

	init(items: [FormViewItemProtocol] = []) {
		defer {
			self.items = items
		}
		super.init(frame: .zero, style: .plain)
		setupFormView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - UITableViewDelegate

extension FormView: UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let item = items[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier) as? FormViewCellProtocol else {
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
		let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier) as? FormViewCellProtocol
			?? item.type.init(style: .default, reuseIdentifier: item.identifier)
		cell.setFormItem(item: item)
		return cell
	}
}

// MARK: - Private

extension FormView {

	private func setupFormView() {
		separatorStyle = .none
		delegate = self
		dataSource = self
		estimatedRowHeight = .ulpOfOne
		backgroundColor = .clear
	}

	private func setupItems() {
		guard Thread.isMainThread else {
			DispatchQueue.main.sync { self.setupItems() }
			return
		}
		items.forEach { register($0.type, forCellReuseIdentifier: $0.identifier) }
	}
}
