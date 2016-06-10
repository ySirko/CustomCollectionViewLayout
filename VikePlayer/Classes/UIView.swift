//
//  UIView.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/8/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let view = bundle.loadNibNamed(String(self.dynamicType), owner: self, options: nil).first
        return view as! UIView
    }
    
    public func addInterpolatingMotionEffect(relativeValue : Float = 20.0) {

        var motionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis);
        motionEffect.minimumRelativeValue = relativeValue;
        motionEffect.maximumRelativeValue = -relativeValue;
        addMotionEffect(motionEffect);
        
        motionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis);
        motionEffect.minimumRelativeValue = relativeValue;
        motionEffect.maximumRelativeValue = -relativeValue;
        
        addMotionEffect(motionEffect);
    }
}