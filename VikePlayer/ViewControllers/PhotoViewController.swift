//
//  PhotoViewController.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/8/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public enum ViewControllerType: String {
    case Photo
    case Video
}

public class PhotoViewController: UIViewController {
    
    private enum Item: Int {
        case Flat
        case Sphere
        case Gyroscope
        case SideBySide
    }
    
    // MAKR: - IBOutlets
    
    @IBOutlet private var tabBar: UITabBar!
    
    // MARK: - Public Properties
    
    public var type: ViewControllerType? = .Photo
    
    // MARK: - Lifecycle
    
    override public func viewDidLoad() {
        setUpUserInterface()
    }
    
    // MARK: - Private Methods
    
    private func setUpUserInterface() {
        
        if let items = tabBar.items {
            tabBar.selectedItem = items[Item.Flat.rawValue]
        }
        
        navigationItem.title = type?.rawValue
    }
}

// MARK: - UITabBarDelegate

extension PhotoViewController: UITabBarDelegate {
    
    public func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        switch item.tag {
        case Item.Flat.rawValue:
            print("Flat")
        case Item.Sphere.rawValue:
            print("Sphere")
        case Item.Gyroscope.rawValue:
            print("Gyroscope")
        case Item.SideBySide.rawValue:
            print("Side By Side")
        default:
            break
        }
    }
}

