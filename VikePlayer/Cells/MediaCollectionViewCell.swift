//
//  MediaCollectionViewCell.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public class MediaCollectionViewCell: UICollectionViewCell, Identifiably {
    
    // MARK: - IBOutlets
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var backgroundImage: UIImageView!
    @IBOutlet public var coverView: UIView!
    
    // MARK: - Layout
    
    public override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let defaultHeight = CollectionLayout.Cell.defaultCellHeight
        let expandedHeight = CollectionLayout.Cell.expandedCellHeight
        
        let delta = 1 - ((expandedHeight - CGRectGetHeight(frame)) / (expandedHeight - defaultHeight))
        
        let minAlpha: CGFloat = 0
        let maxAlpha: CGFloat = 0.5
        
        coverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        
        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransformMakeScale(scale, scale)
        
    }
}