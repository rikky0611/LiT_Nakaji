//
//  AppDelegate.swift
//  tebleViewTest
//
//  Created by yuki takei on 2015/12/07.
//  Copyright © 2015年 yuki takei. All rights reserved.
//

import UIKit

import Bolts
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var imgArray = [UIImage!]()
    var myItems = [String!]()
    var topicDict:NSDictionary = [String : [String]]()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.enableLocalDatastore()
        Parse.setApplicationId("I9TzmkMElAhCIlIbIgbZuLUgUkQdQVhB12Spl3En", clientKey: "UAnH1oKPPP7qUKaN6bWdGcwoUaBI0GK8ccEbzllJ")
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        return true
    }
    
    
//    var window: UIWindow?
//   var myNavigationController: UINavigationController?
//    
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
//        
//        // ViewControllerを生成.
//        let myViewController: ViewController = ViewController()
//        
//        // Navication Controllerを生成.
//        myNavigationController = UINavigationController(rootViewController: myViewController)
//        
//        // UIWindowを生成.
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        
//        // rootViewControllerにNatigationControllerを設定.
//        self.window?.rootViewController = myNavigationController
//        
//        self.window?.makeKeyAndVisible()
////
//        return true
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

