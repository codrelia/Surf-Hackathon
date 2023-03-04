//
//  AppDelegate.swift
//  Template
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        launchApp()
        return true
    }

}

private extension AppDelegate {

    func launchApp() {
        initializeRootView()
        UIApplication.setInitialModule(LaunchAnimationController())
    }

    func initializeRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
    }

}
