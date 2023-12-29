//
//  AppDelegate.swift
//  Weather
//
//  Created by Baki Dikbıyık on 17.12.2023.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        AppRouter.shared.placeOnWindowHome()
        window?.makeKeyAndVisible()
        return true
    }

}
