//
//  UIStoryboard.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/9/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    public enum Storyboard: String {
        case Main
    }
    
    // MARK: - Initializers

    convenience init(storyboard: Storyboard, bundle: NSBundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
}

