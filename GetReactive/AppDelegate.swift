//
//  AppDelegate.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 20.01.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white

        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)

        let rxViewModel = RXLoginViewModel()
        let rxViewController = RXLoginViewController(viewModel: rxViewModel)

        var tabBarControllers: [UIViewController] = []
        let touples: [(UIViewController, ViewModelType)] = [(viewController, viewModel), (rxViewController, rxViewModel)]
        touples.forEach {
            let (viewController, viewModel) = $0
            let navigationViewController = UINavigationController(rootViewController: viewController)

            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .systemYellow
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 30)
            ]
            appearance.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 15)
            ]

            navigationViewController.navigationBar.scrollEdgeAppearance = appearance
            navigationViewController.navigationBar.compactAppearance = appearance
            navigationViewController.navigationBar.standardAppearance = appearance

            let item = UITabBarItem()
            item.title = viewModel.tabBarTitle
            item.image = viewModel.tabBarImage

            navigationViewController.tabBarItem = item

            tabBarControllers.append(navigationViewController)
        }

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = tabBarControllers

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

