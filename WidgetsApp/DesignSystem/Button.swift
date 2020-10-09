//
//  Button.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 09.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

/// Стиль кнопки
///
/// - accept Стиль "Ок"
/// - negative Стиль "Отрицание"
/// - warning Стиль "Предупреждение"
/// - gradient Стиль "Градиент"
enum ButtonStyle {

	case accept
	case negative
	case warning
	case gradient(colorA: UIColor, colorB: UIColor)
}

/// Кнопка
final class Button: UIControl {

	// MARK: - Public Properties

	/// Текст на кнопке.
	var text: String? {
		get {
			return titleLabel.text
		}
		set {
			titleLabel.text = newValue
		}
	}

	var style: ButtonStyle = .accept {
		didSet {
			updateAppearance()
		}
	}

	/// Действие по нажатию
	var action: (() -> Void)?

	/// Стандартная высота кнопки.
	static let standartHeight: CGFloat = 40.0

	/// Стандартные отступы кнопки от краёв.
	static let standartInsets = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)

	// MARK: - Private Properties

	private let backgroundView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = Button.standartHeight / 2
		view.isUserInteractionEnabled = false
		return view
	}()

	private let titleLabel: Label = {
		let label = Label(text: "", style: .bodyBrand)
		label.textAlignment = .center
		return label
	}()

	private let gradient: CAGradientLayer = CAGradientLayer()

	private let animationDuration: TimeInterval = 0.25
	private let sideOffset: CGFloat = 16.0

	// MARK: - Init

	init(buttonStyle: ButtonStyle = .accept, title: String?) {
		super.init(frame: .zero)

		titleLabel.text = text
		style = buttonStyle
		addTarget(self, action: #selector(tap), for: .touchUpInside)
		configureConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) is not implemented")
	}
}

// MARK: - Overrided

extension Button {

	override func layoutSubviews() {
		gradient.frame = bounds
		updateAppearance()
	}

	override public var isHighlighted: Bool {
		didSet {
			guard isHighlighted != oldValue else {
				return
			}
			UIView.animate(withDuration: animationDuration) {
				self.backgroundView.alpha = self.isHighlighted ? 0.5 : 1
			}
		}
	}

	override public var intrinsicContentSize: CGSize {
		return .init(width: UIView.noIntrinsicMetric, height: Button.standartHeight)
	}
}

// MARK: - Private

extension Button {

	private func configureConstraints() {
		for view in [backgroundView, titleLabel] {
			addSubview(view)
			view.translatesAutoresizingMaskIntoConstraints = false
		}

		NSLayoutConstraint.activate([
			backgroundView.topAnchor.constraint(equalTo: topAnchor),
			backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
			backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
			backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

			titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sideOffset),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sideOffset)
		])
	}

	private func updateAppearance() {
		switch style {
		case .accept:
			backgroundView.backgroundColor = Token.smog2.color
		case .negative:
			backgroundView.backgroundColor = Token.negative.color
		case .warning:
			backgroundView.backgroundColor = Token.warning.color
		case let .gradient(colorA: colorA, colorB: colorB):
			setupGradient(colorA, colorB)
		}
	}

	private func setupGradient(_ colorA: UIColor, _ colorB: UIColor) {
		gradient.colors = [colorA.cgColor, colorB.cgColor]
		gradient.locations = [0.0, 1.0]
		gradient.startPoint = .init(x: 0.0, y: 0.0)
		gradient.endPoint = .init(x: 1.0, y: 0.0)
		gradient.cornerRadius = Button.standartHeight / 2
		backgroundView.layer.insertSublayer(gradient, at: 0)
	}

	@objc private func tap() {
		Vibration.heavy.vibrate()
		if let action = action {
			action()
		}
	}
}
