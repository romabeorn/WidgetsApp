//
//  BackgroundAtom.swift
//  WidgetsApp
//
//  Created by Fedor Penin on 05.11.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import Foundation
import UIKit

class BackgroundAtom: UIView {
	required init?(coder: NSCoder) {
		fatalError()
	}

	init(token: Token) {
		super.init(frame: .zero)
		backgroundColor = token.color
	}
}
