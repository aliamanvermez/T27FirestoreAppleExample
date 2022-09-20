//
//  AppDelegate.swift
//  T27FirestoreAppleExample
//
//  Created by NeonApps on 19.09.2022.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    
    var window: UIWindow!
         
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         // Override point for customization after application launch.
         window = UIWindow(frame: UIScreen.main.bounds)
         window.rootViewController = UINavigationController(rootViewController: ViewController())
        window.makeKeyAndVisible()
        FirebaseApp.configure()
         return true
         
     }
    





}

