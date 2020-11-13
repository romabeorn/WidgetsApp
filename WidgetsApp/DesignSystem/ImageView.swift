//
//  ImageView.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 05.11.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

// Вьюшка для картинок
final class ImageView: UIImageView {

	// MARK: - overrided
	init() {
		super.init(frame: .zero)
	}

	init(semanticImage: Icon, configuration: IconConfiguration? = nil) {
		super.init(frame: .zero)
		self.image = semanticImage.image
		self.configuration = configuration
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Public properties
	var configuration: IconConfiguration? {
		didSet {
			updateApperance()
		}
	}

	// MARK: - Private
	private func updateApperance() {
		self.image = self.image?.withRenderingMode(.alwaysTemplate)

		let style = AppDelegate.shared.window?.overrideUserInterfaceStyle
		if (style == .dark) {
			if let light = self.configuration?.lightColor {
				self.tintColor = light
			} else {
				self.tintColor = .lightGray
			}
		} else {
			if let dark = self.configuration?.darkColor {
				self.tintColor = dark
			} else {
				self.tintColor = .darkGray
			}
		}
	}
}
