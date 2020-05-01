//
//  AppDelegate.swift
//  TV List
//
//  Created by Daniel Munoz on 2/28/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    fileprivate func setupAppearance() {
        let navigationBarAppearace = UINavigationBar.appearance()
        if #available(iOS 11.0, *) {
            navigationBarAppearace.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = UIColor(hexString: "1C1C1C")
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBarAppearace.isTranslucent = false
    }


}

