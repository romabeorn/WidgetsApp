//
//  AppDelegate.swift
//  WidgetsApp
//
//  Created by Roman Matveev on 08.10.2020.
//  Copyright © 2020 BeornStudio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = RootViewController()
		window?.makeKeyAndVisible()
		return true
	}
}

extension AppDelegate {

	/// Синглтон AppDelegate
	static var shared: AppDelegate {
		// swiftlint:disable force_cast
		return UIApplication.shared.delegate as! AppDelegate
		// swiftlint: enable force_cast
	}

	/// Корневой UIViewController приложения
	var rootViewController: RootViewController {
		// swiftlint:disable force_cast force_unwrapping
		return window!.rootViewController as! RootViewController
		// swiftlint: enable force_cast force_unwrapping
	}
}
