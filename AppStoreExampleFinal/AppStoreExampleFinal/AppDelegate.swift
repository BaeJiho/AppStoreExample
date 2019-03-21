//
//  AppDelegate.swift
//  AppStoreExampleFinal
//
//  Created by 배지호 on 20/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        let vc = ViewController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: vc)
        return true
    }
}

