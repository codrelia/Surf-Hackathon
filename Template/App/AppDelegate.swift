//
//  AppDelegate.swift
//  Template
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var timer: Timer?
    
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
        
        runLaunchScreen()
        Thread.sleep(forTimeInterval: 1)
        initializeNavigationController()
        let initialModule = LocalStorage.isOnboardingFinished ? MainViewController() : OnboardingViewController()
        UIApplication.setInitialModule(initialModule)
    }

    func initializeNavigationController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewcontroller = MainViewController()
        let navi = UINavigationController(rootViewController: viewcontroller)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
    }
    func runLaunchScreen() {
        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()
        window?.rootViewController = launchScreenViewController
    }
    
    
    
}
