//
//  ChartCell.swift
//  WidgetsApp
//
//  Created by Beorn on 22.04.2021.
//  Copyright © 2021 BeornStudio. All rights reserved.
//

import UIKit

/// Ячейка графика
final class ChartCell: UITableViewCell {

	// MARK: - Private Properties

	private let title: Label = {
		let view = Label(text: "", style: .title)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private let chart: ChartView = {
		let view = ChartView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCell()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - FormViewCellProtocol

extension ChartCell: FormViewCellProtocol {

	func setFormItem(item: FormViewItemProtocol) {
		guard let item = item as? ChartItem else { return }
		title.text = item.title
		chart.points = item.points
	}

	var height: CGFloat { 300 }
}

// MARK: - Private

private extension ChartCell {

	func setupCell() {
		backgroundColor = .clear
		contentView.addSubview(title)
		contentView.addSubview(chart)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			chart.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16.0),
			chart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			chart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			chart.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
