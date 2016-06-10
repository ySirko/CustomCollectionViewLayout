//
//  CellIdentifiably.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public protocol Identifiably {
    
    static var identifier: String { get }
}

extension Identifiably {
    
    public static var identifier: String {
        get {
            return String(Self)
        }
    }
}

extension Identifiably where Self: UICollectionViewCell {
    
    public static var nib: UINib {
        get {
            return UINib(nibName: identifier, bundle: nil)
        }
    }
}