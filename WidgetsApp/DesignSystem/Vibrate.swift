//
//  Vibrate.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 09.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit
import AVFoundation

/// Стиль вибрации
///
/// - error - Ошибка
/// - success - Успех
/// - warning - Предупреждение
/// - light - Легкая
/// - medium - Средняя
/// - heavy - Тяжелая
/// - soft - Мягкая
/// - rigid - Ригид
/// - selection - Выбор
/// - oldSchool - "Олдскул"
enum Vibration: String {

	case error
	case success
	case warning
	case light
	case medium
	case heavy
	@available(iOS 13.0, *)
	case soft
	@available(iOS 13.0, *)
	case rigid
	case selection
	case oldSchool

	/// Провибрировать
	func vibrate() {
		switch self {
		case .error:
			UINotificationFeedbackGenerator().notificationOccurred(.error)
		case .success:
			UINotificationFeedbackGenerator().notificationOccurred(.success)
		case .warning:
			UINotificationFeedbackGenerator().notificationOccurred(.warning)
		case .light:
			UIImpactFeedbackGenerator(style: .light).impactOccurred()
		case .medium:
			UIImpactFeedbackGenerator(style: .medium).impactOccurred()
		case .heavy:
			UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
		case .soft:
			if #available(iOS 13.0, *) {
				UIImpactFeedbackGenerator(style: .soft).impactOccurred()
			}
		case .rigid:
			if #available(iOS 13.0, *) {
				UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
			}
		case .selection:
			UISelectionFeedbackGenerator().selectionChanged()
		case .oldSchool:
			AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
		}
	}
}
