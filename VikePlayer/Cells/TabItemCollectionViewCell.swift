//
//  TabItemCollectionViewCell.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/9/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public class TabItemCollectionViewCell: UICollectionViewCell, Identifiably {
    
    private enum Colors {
        static let selectedItemColor   = UIColor(hex: 0xFFFFFF)
        static let deselectedItemColor = UIColor(hex: 0xD8D8D8, alpha: 0.5)
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: - Public Properties
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public override var selected: Bool {
        didSet {
            // TODO: handle selection
            titleLabel.textColor = selected ? Colors.selectedItemColor : Colors.deselectedItemColor
        }
    }
}

