//
//  AppDelegate.swift
//  firstResponderCrash
//
//  Created by Rob Witman on 7/24/17.
//  Copyright © 2017 Rob Witman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Initialize our window
    window = UIWindow(frame: UIScreen.main.bounds)
    
    // snag the entry point view controller and make it the root (avoiding Storyboards)
    let titleViewController: TitleViewController = TitleViewController(nibName: "TitleViewController", bundle: nil)
    window?.rootViewController = titleViewController
    window?.makeKeyAndVisible()
    return true
  }
}
