//
//  MainView.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

// MARK: - View Delegate

/// MainView Delegate
protocol MainViewDelegate: class {

}

// MARK: - View Data Source

/// MainView Data Source
protocol MainViewDataSource: class {

	/// View получит айтемы
	/// - Parameter view: Модель данных
	func itemsFor(view: MainView) -> [FormViewItemProtocol]?

	func item(at index: Int, view: MainView) -> FormViewItemProtocol?
}

/// View модуля Main
final class MainView: UIView {

	// MARK: - Public Properties

	/// MainView Delegate
	weak var delegate: MainViewDelegate?

	/// MainView Data Source
	weak var dataSource: MainViewDataSource?

	// MARK: - Private Properties

	private let formView = FormView()

	// MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUIElements()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: - Overrided

	override func didMoveToWindow() {
		super.didMoveToWindow()
		setupConstraints()
	}

	// MARK: - Public Methods

	/// Обновление данных View на основе новой модели
	func reloadData() {
		formView.items = dataSource?.itemsFor(view: self) ?? []
	}

	/// Обновление ячейки
	func reloadItem(at index: Int) {
		guard let item = dataSource?.item(at: index, view: self) else { return }
		formView.items[index] = item
	}
}

// MARK: - Private

extension MainView {

	private func setupUIElements() {
		backgroundColor = Token.backgroundSecondary.color
		addSubview(formView)
	}

	private func setupConstraints() {
		formView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			formView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			formView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			formView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			formView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
