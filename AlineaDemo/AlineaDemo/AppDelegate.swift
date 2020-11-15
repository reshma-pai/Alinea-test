//
//  AppDelegate.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let dimensions = UIScreen.main.bounds
        self.window = UIWindow(frame: CGRect(x: 0, y: 0, width: dimensions.width, height: dimensions.height))
        
        let navigationController = UINavigationController()
        let mainViewController = MainScreenViewController()
        navigationController.viewControllers = [mainViewController]
        navigationController.navigationBar.isHidden = true
        
        guard let window = window else {
            return false
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return true
    }
}

