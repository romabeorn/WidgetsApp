//
//  MainView.swift
//  WidgetsApp
//
//  Created Beorn on 22.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

// MARK: - MainView Delegate

/// MainView Delegate
protocol MainViewDelegate: class {

}

// MARK: - MainView Data Source

/// MainView Data Source
protocol MainViewDataSource: class {

	func itemsFor(view: MainView) -> [FormViewItemProtocol]
}

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

	/// Reloading the data and update the ui according to the new data
	func reloadData() {
		formView.items = dataSource?.itemsFor(view: self) ?? []
	}
}

// MARK: - Private

extension MainView {

	private func setupUIElements() {
		backgroundColor = Token.backgroundSecondary.color
		setupFormView()
		setupConstraints()
	}

	private func setupConstraints() {
		addSubview(formView)
		formView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			formView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			formView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			formView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			formView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}

	private func setupFormView() {
		formView.items = dataSource?.itemsFor(view: self) ?? []
	}
}
