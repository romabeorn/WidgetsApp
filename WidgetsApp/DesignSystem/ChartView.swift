//
//  ChartView.swift
//  WidgetsApp
//
//  Created by Beorn on 22.04.2021.
//  Copyright © 2021 BeornStudio. All rights reserved.
//

import UIKit

/// График по точкам
final class ChartView: UIView {

	// MARK: - Public Properties

	var points: [ChartPoint] = [] {
		didSet { setNeedsDisplay() }
	}

	// MARK: - Private Properties

	private let path: UIBezierPath

	private var gradient: CAGradientLayer = CAGradientLayer()

	// MARK: - Life Cycle

	override init(frame: CGRect) {
		path = UIBezierPath()
		super.init(frame: frame)
		backgroundColor = .clear
	}

	required init?(coder: NSCoder) { fatalError("coder: is not implemented") }

	override func draw(_ rect: CGRect) {
		createRectangle()
		createGradient()
	}
}

// MARK: - Private

private extension ChartView {

	func createRectangle() {
		path.removeAllPoints()
		path.move(to: CGPoint(x: -1, y: frame.size.height))
		if let maxYInt = points.max(by: { $0.y < $1.y })?.y, points.count > 1 {
			let maxY = Double(maxYInt)
			let maxX = Double(points.count - 1)
			points.enumerated().forEach { offset, element in
				let doubleOffset = Double(offset)
				let doubleElement = maxY - Double(element.y)
				var x = doubleOffset / maxX * Double(bounds.width)
				x = x == 0 ? -1 : x
				let y = doubleElement / maxY * Double(bounds.height)
				path.addLine(to: CGPoint(x: x, y: y))
			}
		} else {
			path.addLine(to: CGPoint(x: 0, y: 0))
		}
		path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
		path.close()
	}

	func createGradient() {
		gradient.removeFromSuperlayer()
		gradient = CAGradientLayer()
		gradient.frame = path.bounds
		gradient.colors = [UIColor.cyan.cgColor, UIColor.cyan.withAlphaComponent(0).cgColor]

		let shapeMask = CAShapeLayer()
		shapeMask.path = path.cgPath
		gradient.mask = shapeMask

		layer.addSublayer(gradient)
	}
}
