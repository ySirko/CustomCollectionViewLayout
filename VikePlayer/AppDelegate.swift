//
//  AppDelegate.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: - Application Lifecycle

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }
    
    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
        
        if let _ = presentedViewControllerWithRootViewController(window?.rootViewController) as? PhotoViewController {
            return .All
        }
        return .Portrait
    }
    
    // MARK: - Private Methods
    
    private func presentedViewControllerWithRootViewController(rootViewController: UIViewController!) -> UIViewController? {
        if (rootViewController == nil) { return nil }
        if let tabBarController = rootViewController as? UITabBarController {
            return presentedViewControllerWithRootViewController(tabBarController.selectedViewController)
        } else if let navigationController = rootViewController as? UINavigationController {
            return presentedViewControllerWithRootViewController(navigationController.visibleViewController)
        } else if (rootViewController.presentedViewController != nil) {
            return presentedViewControllerWithRootViewController(rootViewController.presentedViewController)
        }
        return rootViewController
    }
}

