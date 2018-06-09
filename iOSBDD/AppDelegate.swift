//
//  AppDelegate.swift
//  iOSBDD
//
//  Created by XueliangZhu on 6/8/18.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if CommandLine.arguments.contains("--uitesting") {
            resetState()
        }
        
        return true
    }
    
    private func resetState() {
        print("reset")
    }
}

