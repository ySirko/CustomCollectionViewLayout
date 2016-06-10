//
//  UIColor.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/9/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - Initializers
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0x00ff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x0000ff00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x000000ff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

